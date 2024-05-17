part of 'playlist_bloc.dart';

class PlaylistEvent extends Equatable {
  const PlaylistEvent();

  @override
  List<Object> get props => [];
}

class FetchPlayListEvent extends PlaylistEvent {
  const FetchPlayListEvent();
  @override
  List<Object> get props => [];
}

class FetchPlayByIdEvent extends PlaylistEvent {
  final int id;
  const FetchPlayByIdEvent({required this.id});
  @override
  List<Object> get props => [];
}
