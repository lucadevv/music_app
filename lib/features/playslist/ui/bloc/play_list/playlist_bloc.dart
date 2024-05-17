import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/features/playslist/domain/entities/playlist_entity.dart';
import 'package:music_app/features/playslist/domain/repositories/playlist_screen_repository.dart';

part 'playlist_event.dart';
part 'playlist_state.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  final PlaylistScreenRepository playlistScreenRepository;
  PlaylistBloc(this.playlistScreenRepository) : super(PlaylistState.initial()) {
    on<FetchPlayListEvent>(fetchPlayListEventState);
  }

  Future<void> fetchPlayListEventState(
      FetchPlayListEvent event, Emitter<PlaylistState> emit) async {
    emit(state.copyWith(playListStatus: PlayListStatus.loading));
    try {
      final response = await playlistScreenRepository.fetPlayList();
      emit(state.copyWith(
        playListStatus: PlayListStatus.sucess,
        playList: response,
      ));
    } catch (e) {
      emit(state.copyWith(playListStatus: PlayListStatus.error));
    }
  }
}
