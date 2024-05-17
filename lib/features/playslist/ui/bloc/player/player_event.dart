part of 'player_bloc.dart';

abstract class PlayerEvent extends Equatable {
  const PlayerEvent();
  @override
  List<Object> get props => [];
}

class FetcTracksEvent extends PlayerEvent {
  final List<TrackEntity> listModel;

  const FetcTracksEvent({required this.listModel});
}

class FetcTrackIdEvent extends PlayerEvent {
  final TrackEntity model;
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

class PreviusEvent extends PlayerEvent {}
