part of 'player_favorite_music_bloc.dart';

enum FavoriteReproductorStatus { initial, play, pause, resume, stop }

enum FavoritePlayerStatus { initial, loading, sucess, error }

class PlayerFavoriteMusicState extends Equatable {
  final List<TrackEntity> tracksList;
  final Duration currentPosition;
  final Duration totalPosition;
  final FavoritePlayerStatus status;
  final FavoriteReproductorStatus reproductorStatus;
  final TrackEntity currentTrack;
  final int index;
  const PlayerFavoriteMusicState({
    required this.tracksList,
    required this.currentPosition,
    required this.totalPosition,
    required this.status,
    required this.reproductorStatus,
    required this.currentTrack,
    required this.index,
  });

  PlayerFavoriteMusicState copyWith({
    List<TrackEntity>? tracksList,
    Duration? currentPosition,
    Duration? totalPosition,
    FavoritePlayerStatus? status,
    FavoriteReproductorStatus? reproductorStatus,
    TrackEntity? currentTrack,
    int? index,
  }) =>
      PlayerFavoriteMusicState(
        tracksList: tracksList ?? this.tracksList,
        currentPosition: currentPosition ?? this.currentPosition,
        totalPosition: totalPosition ?? this.totalPosition,
        status: status ?? this.status,
        reproductorStatus: reproductorStatus ?? this.reproductorStatus,
        currentTrack: currentTrack ?? this.currentTrack,
        index: index ?? this.index,
      );

  factory PlayerFavoriteMusicState.initial() {
    return const PlayerFavoriteMusicState(
      tracksList: [],
      currentPosition: Duration.zero,
      totalPosition: Duration.zero,
      status: FavoritePlayerStatus.initial,
      reproductorStatus: FavoriteReproductorStatus.initial,
      currentTrack: TrackEntity.empty(),
      index: -1,
    );
  }

  @override
  List<Object> get props => [
        tracksList,
        currentPosition,
        totalPosition,
        status,
        reproductorStatus,
        currentTrack,
        index,
      ];
}
