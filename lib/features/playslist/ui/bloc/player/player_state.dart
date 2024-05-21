part of 'player_bloc.dart';

enum ReproductorStatus { initial, play, pause, resume, stop }

enum PlayerStatus { initial, loading, sucess, error }

class PlayerState extends Equatable {
  final List<TrackEntity> tracksList;
  final Duration currentPosition;
  final Duration totalPosition;
  final PlayerStatus status;
  final ReproductorStatus reproductorStatus;
  final TrackEntity currentTrack;
  final int index;
  const PlayerState({
    required this.tracksList,
    required this.currentPosition,
    required this.totalPosition,
    required this.status,
    required this.currentTrack,
    required this.reproductorStatus,
    required this.index,
  });

  PlayerState copyWith({
    List<TrackEntity>? tracksList,
    Duration? currentPosition,
    Duration? totalPosition,
    PlayerStatus? status,
    TrackEntity? currentTrack,
    ReproductorStatus? reproductorStatus,
    int? index,
  }) =>
      PlayerState(
        tracksList: tracksList ?? this.tracksList,
        currentPosition: currentPosition ?? this.currentPosition,
        totalPosition: totalPosition ?? this.totalPosition,
        status: status ?? this.status,
        currentTrack: currentTrack ?? this.currentTrack,
        reproductorStatus: reproductorStatus ?? this.reproductorStatus,
        index: index ?? this.index,
      );
  factory PlayerState.initial() {
    return const PlayerState(
      tracksList: [],
      currentPosition: Duration.zero,
      totalPosition: Duration.zero,
      status: PlayerStatus.initial,
      currentTrack: TrackEntity.empty(),
      reproductorStatus: ReproductorStatus.initial,
      index: -1,
    );
  }
  @override
  List<Object> get props => [
        tracksList,
        currentPosition,
        totalPosition,
        status,
        currentTrack,
        reproductorStatus,
        index,
      ];
}
