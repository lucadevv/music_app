part of 'favorite_music_bloc.dart';

enum FavoriteMusicStatus { initial, loading, sucess, error }

class FavoriteMusicState extends Equatable {
  final List<YourFavoriteMusicEntity> favoriteListMusic;
  final FavoriteMusicStatus status;
  const FavoriteMusicState({
    required this.favoriteListMusic,
    required this.status,
  });

  factory FavoriteMusicState.intial() {
    return const FavoriteMusicState(
      favoriteListMusic: [],
      status: FavoriteMusicStatus.initial,
    );
  }

  FavoriteMusicState copyWith({
    List<YourFavoriteMusicEntity>? favoriteListMusic,
    FavoriteMusicStatus? status,
  }) =>
      FavoriteMusicState(
        favoriteListMusic: favoriteListMusic ?? this.favoriteListMusic,
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [favoriteListMusic, status];
}
