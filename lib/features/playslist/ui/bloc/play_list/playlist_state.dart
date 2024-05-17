part of 'playlist_bloc.dart';

enum PlayListStatus { initial, loading, sucess, error }

class PlaylistState extends Equatable {
  final PlayListEntity playList;
  final PlayListStatus playListStatus;

  const PlaylistState({
    required this.playList,
    required this.playListStatus,
  });
  PlaylistState copyWith({
    PlayListEntity? playList,
    PlayListStatus? playListStatus,
  }) =>
      PlaylistState(
        playList: playList ?? this.playList,
        playListStatus: playListStatus ?? this.playListStatus,
      );

  factory PlaylistState.initial() {
    return PlaylistState(
      playList: PlayListEntity.empty(),
      playListStatus: PlayListStatus.initial,
    );
  }

  @override
  List<Object> get props => [playList, playListStatus];
}
