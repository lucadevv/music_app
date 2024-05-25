part of 'artist_bloc.dart';

enum ArtistStatus { initial, loading, success, error }

class ArtistState extends Equatable {
  final ArtistStatus status;
  final List<ArtistTracksEntity> list;
  final ArtistEntity currentArtist;

  const ArtistState({
    required this.status,
    required this.list,
    required this.currentArtist,
  });

  ArtistState copyWith({
    ArtistStatus? status,
    List<ArtistTracksEntity>? list,
    ArtistEntity? currentArtist,
  }) =>
      ArtistState(
        status: status ?? this.status,
        list: list ?? this.list,
        currentArtist: currentArtist ?? this.currentArtist,
      );
  factory ArtistState.initial() {
    return ArtistState(
      status: ArtistStatus.initial,
      list: const [],
      currentArtist: ArtistEntity.empty(),
    );
  }

  @override
  List<Object> get props => [status, list, currentArtist];
}
