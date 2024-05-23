import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/features/playslist/domain/entities/track_entity.dart';
part 'player_favorite_music_event.dart';
part 'player_favorite_music_state.dart';

class PlayerFavoriteMusicBloc
    extends Bloc<PlayerFavoriteMusicEvent, PlayerFavoriteMusicState> {
  final AudioPlayer audioPlayer;
  int currentTrackIndex = -1;
  PlayerFavoriteMusicBloc({required this.audioPlayer})
      : super(PlayerFavoriteMusicState.initial()) {
    audioPlayer.onDurationChanged.listen((duration) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(totalPosition: duration));
    });

    // Escucha los cambios en la posición actual del audio
    audioPlayer.onPositionChanged.listen((position) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(currentPosition: position));
    });

    //Escucha cuando el audio se completa
    audioPlayer.onPlayerComplete.listen((event) {
      add(NextFavoriteEvent());
    });
    audioPlayer.onPlayerComplete.listen((event) {
      add(StopFavoriteEvent());
    });
    on<FetchAllFavoriteMusic>(fetchAllFavoriteMusic);
    on<FetchByIdFavoriteMusic>(fetchByIdFavoriteMusic);
    on<PlayFavoriteEvent>(playFavoriteEvent);
    on<ToggleFavoriteEnvet>(toggleFavoriteEnvet);
    on<NextFavoriteEvent>(nextFavoriteEvent);
    on<PauseFavoriteEvent>(pauseFavoriteEvent);
    on<StopFavoriteEvent>(stopFavoriteEvent);
    on<PreviusFavoriteEvent>(previusFavoriteEvent);
    on<SeekFavoriteEvent>(seekFavoriteEvent);
  }

  Future<void> fetchAllFavoriteMusic(FetchAllFavoriteMusic event,
      Emitter<PlayerFavoriteMusicState> emit) async {
    emit(state.copyWith(
      status: FavoritePlayerStatus.loading,
    ));
    try {
      final response = event.listModel;
      final trackList = response;
      emit(state.copyWith(
          tracksList: trackList, status: FavoritePlayerStatus.sucess));
    } catch (e) {
      emit(state.copyWith(status: FavoritePlayerStatus.error));
    }
  }

  Future<void> fetchByIdFavoriteMusic(FetchByIdFavoriteMusic event,
      Emitter<PlayerFavoriteMusicState> emit) async {
    try {
      final newState = state.copyWith(currentTrack: event.model);
      emit(newState);
    } catch (e) {
      emit(state.copyWith(status: FavoritePlayerStatus.error));
    }
  }

  Future<void> playFavoriteEvent(
      PlayFavoriteEvent event, Emitter<PlayerFavoriteMusicState> emit) async {
    try {
      await audioPlayer.setSourceUrl(event.urlMp3);
      await audioPlayer.play(UrlSource(event.urlMp3));
      currentTrackIndex = event.index;

      emit(state.copyWith(
        status: FavoritePlayerStatus.sucess,
        reproductorStatus: FavoriteReproductorStatus.play,
        index: currentTrackIndex,
      ));
    } catch (e) {
      emit(state.copyWith(status: FavoritePlayerStatus.error));
    }
  }

  Future<void> toggleFavoriteEnvet(
      ToggleFavoriteEnvet event, Emitter<PlayerFavoriteMusicState> emit) async {
    if (state.reproductorStatus == FavoriteReproductorStatus.play) {
      await audioPlayer.pause();
      emit(state.copyWith(reproductorStatus: FavoriteReproductorStatus.pause));
    } else {
      await audioPlayer.resume();
      emit(state.copyWith(reproductorStatus: FavoriteReproductorStatus.play));
    }
  }

  Future<void> nextFavoriteEvent(
      NextFavoriteEvent event, Emitter<PlayerFavoriteMusicState> emit) async {
    if (currentTrackIndex < state.tracksList.length - 1) {
      currentTrackIndex++;
      final nextTrack = state.tracksList[currentTrackIndex];
      add(PlayFavoriteEvent(
          urlMp3: nextTrack.urlMp3, index: currentTrackIndex));
      emit(state.copyWith(
        currentTrack: nextTrack,
        index: currentTrackIndex,
      ));
    }
  }

  Future<void> previusFavoriteEvent(PreviusFavoriteEvent event,
      Emitter<PlayerFavoriteMusicState> emit) async {
    if (state.tracksList.length - 1 > currentTrackIndex) {
      currentTrackIndex--;
      final nextTrack = state.tracksList[currentTrackIndex];
      add(PlayFavoriteEvent(
          urlMp3: nextTrack.urlMp3, index: currentTrackIndex));
      emit(state.copyWith(
        currentTrack: nextTrack,
        index: currentTrackIndex,
      ));
    }
  }

  Future<void> seekFavoriteEvent(
      SeekFavoriteEvent event, Emitter<PlayerFavoriteMusicState> emit) async {
    emit(state.copyWith(
      currentPosition: event.seek,
    ));
    await audioPlayer.seek(event.seek);
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    audioPlayer.stop();
    return super.close();
  }

  Future<void> stopFavoriteEvent(
      StopFavoriteEvent event, Emitter<PlayerFavoriteMusicState> emit) async {
    await audioPlayer.stop();
    emit(state.copyWith(reproductorStatus: FavoriteReproductorStatus.stop));
  }

  Future<void> pauseFavoriteEvent(
      PauseFavoriteEvent event, Emitter<PlayerFavoriteMusicState> emit) async {
    await audioPlayer.pause();
    emit(state.copyWith(reproductorStatus: FavoriteReproductorStatus.pause));
  }
}
