part of 'download_bloc.dart';

enum DownloadStatus { initial, loading, succes, errror }

class DownloadState extends Equatable {
  final List<MusicLocalDb> list;
  final DownloadStatus status;
  const DownloadState({
    required this.list,
    required this.status,
  });

  DownloadState copyWith({
    List<MusicLocalDb>? list,
    DownloadStatus? status,
  }) =>
      DownloadState(
        list: list ?? this.list,
        status: status ?? this.status,
      );
  factory DownloadState.initial() {
    return const DownloadState(
      list: [],
      status: DownloadStatus.initial,
    );
  }

  @override
  List<Object> get props => [list, status];
}
