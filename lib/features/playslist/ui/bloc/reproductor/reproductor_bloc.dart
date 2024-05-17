import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'reproductor_event.dart';
part 'reproductor_state.dart';

class ReproductorBloc extends Bloc<ReproductorEvent, ReproductorState> {
  final AudioPlayer audioPlayer = AudioPlayer();
  ReproductorBloc()
      : super(const ReproductorState(
          currentPosition: Duration.zero,
          totalDuration: Duration.zero,
        )) {
    // Escucha los cambios de duración total del audio
    audioPlayer.onDurationChanged.listen((duration) {
      emit(state.copyWith(totalDuration: duration));
      // state.copyWith(totalDuration: duration);
    });

    // Escucha los cambios en la posición actual del audio
    audioPlayer.onPositionChanged.listen((position) {
      emit(state.copyWith(currentPosition: position));
      // state.copyWith(currentPosition: position);
    });

    on<PlayerPLayEvent>(playerPlayEvent);
    on<PlayerStopEvent>(playerStopEvent);
    on<PlayerToggleEvent>(playerToggleEvent);
  }

  Future<void> playerPlayEvent(
      PlayerPLayEvent event, Emitter<ReproductorState> emit) async {
    try {
      await audioPlayer.setSourceUrl(event.urlMp3);
      await audioPlayer.play(UrlSource(event.urlMp3));
      emit(state.copyWith(isPlaying: true));
    } catch (e) {
      rethrow;
      // Puedes optar por manejar el error de manera más formal aquí.
    }
  }

  Future<void> playerToggleEvent(
      PlayerToggleEvent event, Emitter<ReproductorState> emit) async {
    if (state.isPlaying) {
      await audioPlayer.pause();
      emit(state.copyWith(isPlaying: false));
    } else {
      await audioPlayer.resume();
      emit(state.copyWith(isPlaying: true));
    }
  }

  Future<void> playerStopEvent(
      PlayerStopEvent event, Emitter<ReproductorState> emit) async {
    await audioPlayer.stop();
    emit(state.copyWith(reproductorStatus: ReproductorStatus.stopped));
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
