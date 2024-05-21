import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/features/home/domain/entites/your_favorite_music_entity.dart';
import 'package:music_app/features/home/domain/repository/favorite_music_repository.dart';

part 'favorite_music_event.dart';
part 'favorite_music_state.dart';

class FavoriteMusicBloc extends Bloc<FavoriteMusicEvent, FavoriteMusicState> {
  final FavoriteMusicRepository favoriteMusicRepository;
  FavoriteMusicBloc({required this.favoriteMusicRepository})
      : super(FavoriteMusicState.intial()) {
    on<FetchAllFavoriteMusicEvent>(fetchAllFavoriteMusicEvent);
    on<AddFavoriteMusicEvent>(addFavoriteMusicEvent);
    on<RemoveFavoriteMusicEvent>(removeFavoriteMusicEvent);
  }

  Future<void> fetchAllFavoriteMusicEvent(FetchAllFavoriteMusicEvent event,
      Emitter<FavoriteMusicState> emit) async {
    emit(state.copyWith(status: FavoriteMusicStatus.loading));

    try {
      final response = await favoriteMusicRepository.fetchAllFavoriteMusic();
      emit(state.copyWith(
        status: FavoriteMusicStatus.sucess,
        favoriteListMusic: response,
      ));
    } catch (e) {
      emit(state.copyWith(status: FavoriteMusicStatus.error));
    }
  }

  Future<void> addFavoriteMusicEvent(
      AddFavoriteMusicEvent event, Emitter<FavoriteMusicState> emit) async {
    emit(state.copyWith(status: FavoriteMusicStatus.loading));
    try {
      favoriteMusicRepository.addFavoriteMusic(model: event.model);
      emit(state.copyWith(status: FavoriteMusicStatus.sucess));
    } catch (e) {
      emit(state.copyWith(status: FavoriteMusicStatus.error));
    }
  }

  Future<void> removeFavoriteMusicEvent(
      RemoveFavoriteMusicEvent event, Emitter<FavoriteMusicState> emit) async {
    emit(state.copyWith(status: FavoriteMusicStatus.loading));
    try {
      favoriteMusicRepository.removeFavorite(model: event.model.track);
      emit(state.copyWith(status: FavoriteMusicStatus.sucess));
    } catch (e) {
      emit(state.copyWith(status: FavoriteMusicStatus.error));
    }
  }
}
