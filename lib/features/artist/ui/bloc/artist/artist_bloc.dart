import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/features/artist/domain/entities/artist/artist_entity.dart';
import 'package:music_app/features/artist/domain/entities/list_track_artist/artist_tracks_entity.dart';
import 'package:music_app/features/artist/domain/rositories/artist_repository.dart';

part 'artist_event.dart';
part 'artist_state.dart';

class ArtistBloc extends Bloc<ArtistEvent, ArtistState> {
  final ArtistRepository artistRepository;
  ArtistBloc({required this.artistRepository}) : super(ArtistState.initial()) {
    on<FetchListMusicArtist>(fetchListMusicArtist);
    on<FetchArtist>(fetchArtist);
  }

  Future<void> fetchListMusicArtist(
      FetchListMusicArtist event, Emitter<ArtistState> emit) async {
    emit(state.copyWith(status: ArtistStatus.loading));
    try {
      final response =
          await artistRepository.fetchAllTracksArtist(url: event.urlPath);
      emit(state.copyWith(status: ArtistStatus.success, list: response));
    } catch (e) {
      emit(state.copyWith(status: ArtistStatus.error));
    }
  }

  Future<void> fetchArtist(FetchArtist event, Emitter<ArtistState> emit) async {
    emit(state.copyWith(status: ArtistStatus.loading));
    try {
      final response = await artistRepository.fetchArtist(id: event.id);

      emit(state.copyWith(
          status: ArtistStatus.success, currentArtist: response));
    } catch (e) {
      emit(state.copyWith(status: ArtistStatus.error));
    }
  }
}
