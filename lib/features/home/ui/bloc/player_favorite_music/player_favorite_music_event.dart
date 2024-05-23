part of 'player_favorite_music_bloc.dart';

abstract class PlayerFavoriteMusicEvent extends Equatable {
  const PlayerFavoriteMusicEvent();

  @override
  List<Object> get props => [];
}

class FetchAllFavoriteMusic extends PlayerFavoriteMusicEvent {
  final List<TrackEntity> listModel;

  const FetchAllFavoriteMusic({required this.listModel});
}

class FetchByIdFavoriteMusic extends PlayerFavoriteMusicEvent {
  final TrackEntity model;
  const FetchByIdFavoriteMusic({required this.model});
}

class PlayFavoriteEvent extends PlayerFavoriteMusicEvent {
  final String urlMp3;
  final int index;

  const PlayFavoriteEvent({
    required this.urlMp3,
    required this.index,
  });
}

class ToggleFavoriteEnvet extends PlayerFavoriteMusicEvent {}

class ResumenFavoriteEvent extends PlayerFavoriteMusicEvent {}

class StopFavoriteEvent extends PlayerFavoriteMusicEvent {}

class PauseFavoriteEvent extends PlayerFavoriteMusicEvent {}

class NextFavoriteEvent extends PlayerFavoriteMusicEvent {}

class PreviusFavoriteEvent extends PlayerFavoriteMusicEvent {}

class SeekFavoriteEvent extends PlayerFavoriteMusicEvent {
  final Duration seek;

  const SeekFavoriteEvent({required this.seek});
  @override
  List<Object> get props => [seek];
}
