import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/features/home/domain/repository/download_music_repository.dart';
import 'package:music_app/shared/database_service/models/music_localdb.dart';

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  final DownloadMusicRepository downloadMusicRepository;
  DownloadBloc({required this.downloadMusicRepository})
      : super(DownloadState.initial()) {
    on<GetALLMusicDownloadEvent>(getALLMusicDownloadEvent);
    on<InserMusicDownloadEvent>(inserMusicDownloadEvent);
  }

  Future<void> getALLMusicDownloadEvent(
      GetALLMusicDownloadEvent event, Emitter<DownloadState> emit) async {
    emit(state.copyWith(status: DownloadStatus.loading));
    try {
      final response = await downloadMusicRepository.getAllMusicDownload();

      emit(state.copyWith(list: response, status: DownloadStatus.succes));
    } catch (e) {
      emit(state.copyWith(status: DownloadStatus.errror));
    }
  }

  Future<void> inserMusicDownloadEvent(
      InserMusicDownloadEvent event, Emitter<DownloadState> emit) async {
    emit(state.copyWith(status: DownloadStatus.loading));
    try {
      await downloadMusicRepository.insertMusic(music: event.musicLocalDb);
      emit(state.copyWith(status: DownloadStatus.succes));
    } catch (e) {
      emit(state.copyWith(status: DownloadStatus.errror));
    }
  }
}
