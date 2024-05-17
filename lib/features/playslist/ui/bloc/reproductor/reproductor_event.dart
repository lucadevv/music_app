part of 'reproductor_bloc.dart';

class ReproductorEvent extends Equatable {
  const ReproductorEvent();

  @override
  List<Object> get props => [];
}

class PlayerPLayEvent extends ReproductorEvent {
  final String urlMp3;
  const PlayerPLayEvent({required this.urlMp3});
  @override
  List<Object> get props => [];
}

class PlayerPauseEvent extends ReproductorEvent {
  const PlayerPauseEvent();
  @override
  List<Object> get props => [];
}

class PlayerStopEvent extends ReproductorEvent {
  const PlayerStopEvent();
  @override
  List<Object> get props => [];
}

class PlayerToggleEvent extends ReproductorEvent {
  const PlayerToggleEvent();
  @override
  List<Object> get props => [];
}

class SetupAudioPlayerEvent extends ReproductorEvent {
  const SetupAudioPlayerEvent();
}
