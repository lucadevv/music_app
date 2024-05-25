part of 'download_bloc.dart';

abstract class DownloadEvent extends Equatable {
  const DownloadEvent();

  @override
  List<Object> get props => [];
}

class GetALLMusicDownloadEvent extends DownloadEvent {}

class InserMusicDownloadEvent extends DownloadEvent {
  final MusicLocalDb musicLocalDb;

  const InserMusicDownloadEvent({required this.musicLocalDb});

  @override
  List<Object> get props => [musicLocalDb];
}
