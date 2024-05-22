part of 'player_favorite_music_bloc.dart';

sealed class PlayerFavoriteMusicState extends Equatable {
  const PlayerFavoriteMusicState();
  
  @override
  List<Object> get props => [];
}

final class PlayerFavoriteMusicInitial extends PlayerFavoriteMusicState {}
