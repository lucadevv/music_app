part of 'reproductor_bloc.dart';

enum ReproductorStatus { stopped, playing, paused }

class ReproductorState extends Equatable {
  final ReproductorStatus reproductorStatus;
  final bool isPlaying;
  final Duration currentPosition;
  final Duration totalDuration;
  const ReproductorState({
    this.reproductorStatus = ReproductorStatus.stopped,
    required this.currentPosition,
    required this.totalDuration,
    this.isPlaying = false,
  });
  ReproductorState copyWith({
    ReproductorStatus? reproductorStatus,
    Duration? currentPosition,
    Duration? totalDuration,
    bool? isPlaying,
  }) =>
      ReproductorState(
        reproductorStatus: reproductorStatus ?? this.reproductorStatus,
        currentPosition: currentPosition ?? this.currentPosition,
        totalDuration: totalDuration ?? this.totalDuration,
        isPlaying: isPlaying ?? this.isPlaying,
      );

  @override
  List<Object> get props =>
      [reproductorStatus, currentPosition, totalDuration, isPlaying];
}
