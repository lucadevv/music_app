part of 'player_bloc.dart';

abstract class PlayerEvent extends Equatable {
  const PlayerEvent();
  @override
  List<Object> get props => [];
}

class FetcTracksEvent extends PlayerEvent {
  final List<TrackGloablEntity> listModel;

  const FetcTracksEvent({required this.listModel});
}

class FetcTrackIdEvent extends PlayerEvent {
  final TrackGloablEntity model;
  const FetcTrackIdEvent({required this.model});
}

class PlayEvent extends PlayerEvent {
  final String urlMp3;
  final int index;

  const PlayEvent({
    required this.urlMp3,
    required this.index,
  });
}

class ToggleEnvet extends PlayerEvent {}

class ResumenEvent extends PlayerEvent {}

class StopEvent extends PlayerEvent {}

class NextEvent extends PlayerEvent {}

class PauseEvent extends PlayerEvent {}

class PreviusEvent extends PlayerEvent {}

class SeekEvent extends PlayerEvent {
  final Duration seek;

  const SeekEvent({required this.seek});
  @override
  List<Object> get props => [seek];
}
