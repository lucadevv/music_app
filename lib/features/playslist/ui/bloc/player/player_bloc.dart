import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/features/playslist/domain/entities/track_entity.dart';
part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final AudioPlayer audioPlayer;

  int currentTrackIndex = -1;
  PlayerBloc({required this.audioPlayer}) : super(PlayerState.initial()) {
    // Escucha los cambios de duración total del audio
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
      add(NextEvent());
    });
    on<FetcTracksEvent>(fetcTracksEvent);
    on<FetcTrackIdEvent>(fetcTrackIdEvent);
    on<PlayEvent>(playEvent);
    on<ToggleEnvet>(toggleEnvet);
    on<NextEvent>(nextEvent);
    on<PreviusEvent>(previusEvent);
  }
  Future<void> fetcTracksEvent(
      FetcTracksEvent event, Emitter<PlayerState> emit) async {
    emit(state.copyWith(
      status: PlayerStatus.loading,
    ));
    try {
      final response = event.listModel;
      final trackList = response;
      emit(state.copyWith(tracksList: trackList, status: PlayerStatus.sucess));
    } catch (e) {
      emit(state.copyWith(status: PlayerStatus.error));
    }
  }

  Future<void> fetcTrackIdEvent(
      FetcTrackIdEvent event, Emitter<PlayerState> emit) async {
    try {
      final newState = state.copyWith(currentTrack: event.model);
      emit(newState);
    } catch (e) {
      emit(state.copyWith(status: PlayerStatus.error));
    }
  }

  Future<void> playEvent(PlayEvent event, Emitter<PlayerState> emit) async {
    try {
      await audioPlayer.setSourceUrl(event.urlMp3);
      await audioPlayer.play(UrlSource(event.urlMp3));
      currentTrackIndex = event.index;
      print(currentTrackIndex);
      emit(state.copyWith(
        status: PlayerStatus.sucess,
        reproductorStatus: ReproductorStatus.play,
        index: currentTrackIndex,
      ));
    } catch (e) {
      emit(state.copyWith(status: PlayerStatus.error));
    }
  }

  Future<void> nextEvent(NextEvent event, Emitter<PlayerState> emit) async {
    if (currentTrackIndex < state.tracksList.length - 1) {
      currentTrackIndex++;
      final nextTrack = state.tracksList[currentTrackIndex];
      add(PlayEvent(urlMp3: nextTrack.urlMp3, index: currentTrackIndex));
      emit(state.copyWith(
        currentTrack: nextTrack,
        index: currentTrackIndex,
      ));
    }
  }

  Future<void> previusEvent(
      PreviusEvent event, Emitter<PlayerState> emit) async {
    if (state.tracksList.length - 1 > currentTrackIndex) {
      currentTrackIndex--;
      final nextTrack = state.tracksList[currentTrackIndex];
      add(PlayEvent(urlMp3: nextTrack.urlMp3, index: currentTrackIndex));
      emit(state.copyWith(
        currentTrack: nextTrack,
        index: currentTrackIndex,
      ));
    }
  }

  Future<void> toggleEnvet(ToggleEnvet event, Emitter<PlayerState> emit) async {
    if (state.reproductorStatus == ReproductorStatus.play) {
      await audioPlayer.pause();
      emit(state.copyWith(reproductorStatus: ReproductorStatus.pause));
    } else {
      await audioPlayer.resume();
      emit(state.copyWith(reproductorStatus: ReproductorStatus.play));
    }
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
