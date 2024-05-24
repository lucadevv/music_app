part of 'favorite_music_bloc.dart';

abstract class FavoriteMusicEvent extends Equatable {
  const FavoriteMusicEvent();

  @override
  List<Object> get props => [];
}

class FetchAllFavoriteMusicEvent extends FavoriteMusicEvent {
  const FetchAllFavoriteMusicEvent();
  @override
  List<Object> get props => [];
}

class AddFavoriteMusicEvent extends FavoriteMusicEvent {
  final YourFavoriteMusicEntity model;
  const AddFavoriteMusicEvent({required this.model});
  @override
  List<Object> get props => [model];
}

class RemoveFavoriteMusicEvent extends FavoriteMusicEvent {
  final int id;
  const RemoveFavoriteMusicEvent({required this.id});
  @override
  List<Object> get props => [id];
}
