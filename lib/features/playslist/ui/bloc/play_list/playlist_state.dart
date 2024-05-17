part of 'playlist_bloc.dart';

enum PlayListStatus { initial, loading, sucess, error }

class PlaylistState extends Equatable {
  final PlayListEntity playList;
  final PlayListStatus playListStatus;
  final TrackEntity trackEntity;
  const PlaylistState({
    required this.playList,
    required this.playListStatus,
    required this.trackEntity,
  });
  PlaylistState copyWith({
    PlayListEntity? playList,
    PlayListStatus? playListStatus,
    TrackEntity? trackEntity,
  }) =>
      PlaylistState(
        playList: playList ?? this.playList,
        playListStatus: playListStatus ?? this.playListStatus,
        trackEntity: trackEntity ?? this.trackEntity,
      );

  factory PlaylistState.initial() {
    return PlaylistState(
      playList: PlayListEntity.empty(),
      playListStatus: PlayListStatus.initial,
      trackEntity: TrackEntity.empty(),
    );
  }

  @override
  List<Object> get props => [playList, playListStatus, trackEntity];
}
