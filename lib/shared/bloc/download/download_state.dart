part of 'download_bloc.dart';

sealed class DownloadState extends Equatable {
  const DownloadState();
  
  @override
  List<Object> get props => [];
}

final class DownloadInitial extends DownloadState {}
