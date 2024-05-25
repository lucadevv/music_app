part of 'artist_bloc.dart';

abstract class ArtistEvent extends Equatable {
  const ArtistEvent();

  @override
  List<Object> get props => [];
}

class FetchListMusicArtist extends ArtistEvent {
  final String urlPath;

  const FetchListMusicArtist({required this.urlPath});
  @override
  List<Object> get props => [urlPath];
}

class FetchArtist extends ArtistEvent {
  final int id;

  const FetchArtist({required this.id});
  @override
  List<Object> get props => [id];
}
