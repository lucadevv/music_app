part of 'artist_bloc.dart';

enum ArtistStatus { initial, loading, success, error }

enum CurrentArtistStatus { initial, loading, success, errro }

class ArtistState extends Equatable {
  final ArtistStatus status;
  final List<ArtistTracksEntity> list;
  final ArtistEntity currentArtist;
  final CurrentArtistStatus currentArtistStatus;

  const ArtistState({
    required this.status,
    required this.list,
    required this.currentArtist,
    required this.currentArtistStatus,
  });

  ArtistState copyWith({
    ArtistStatus? status,
    List<ArtistTracksEntity>? list,
    ArtistEntity? currentArtist,
    CurrentArtistStatus? currentArtistStatus,
  }) =>
      ArtistState(
        status: status ?? this.status,
        list: list ?? this.list,
        currentArtist: currentArtist ?? this.currentArtist,
        currentArtistStatus: currentArtistStatus ?? this.currentArtistStatus,
      );
  factory ArtistState.initial() {
    return ArtistState(
      status: ArtistStatus.initial,
      list: const [],
      currentArtist: ArtistEntity.empty(),
      currentArtistStatus: CurrentArtistStatus.initial,
    );
  }

  @override
  List<Object> get props => [status, list, currentArtist, currentArtistStatus];
}
