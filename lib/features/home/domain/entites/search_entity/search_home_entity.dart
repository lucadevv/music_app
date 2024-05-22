import 'package:equatable/equatable.dart';
import 'package:music_app/features/home/data/network/model/search_model/data_model_db.dart';
import 'package:music_app/features/home/domain/entites/album_home_entity.dart';
import 'package:music_app/features/home/domain/entites/artist_home_entity.dart';

class SearchHomeEntity extends Equatable {
  final int id;
  final String title;
  final String titleShort;
  final String shared;
  final int duration;
  final String urlMp3;
  final ArtistHomeEntity artist;
  final AlbumHomeEntity album;

  const SearchHomeEntity({
    required this.id,
    required this.title,
    required this.titleShort,
    required this.shared,
    required this.urlMp3,
    required this.artist,
    required this.album,
    required this.duration,
  });

  factory SearchHomeEntity.fromModel(Data databd) {
    return SearchHomeEntity(
      id: databd.id,
      title: databd.title,
      titleShort: databd.titleShort,
      shared: databd.link,
      urlMp3: databd.preview,
      artist: ArtistHomeEntity.fromModel(databd.artist),
      album: AlbumHomeEntity.fromModel(databd.album),
      duration: databd.duration,
    );
  }

  factory SearchHomeEntity.empty() {
    return SearchHomeEntity(
      id: -1,
      title: "",
      titleShort: "",
      shared: "",
      urlMp3: "",
      artist: ArtistHomeEntity.empty(),
      album: AlbumHomeEntity.empty(),
      duration: 0,
    );
  }

  @override
  List<Object?> get props =>
      [id, title, titleShort, shared, duration, urlMp3, artist, album];
}
