import 'package:equatable/equatable.dart';
import 'package:music_app/features/home/domain/entites/search_entity/search_home_entity.dart';

class TrackEntity extends Equatable {
  final int id;
  final String title;
  final String author;
  final int duration;
  final String urlMp3;
  final String imagePath;

  const TrackEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.duration,
    required this.urlMp3,
    required this.imagePath,
  });

  const TrackEntity.empty()
      : id = 0,
        title = "",
        author = "",
        duration = 0,
        urlMp3 = '',
        imagePath = "";

  factory TrackEntity.fromModel(SearchHomeEntity et) => TrackEntity(
        id: et.id,
        title: et.titleShort,
        author: et.artist.name,
        duration: et.duration,
        urlMp3: et.urlMp3,
        imagePath: et.album.imagePathMedium,
      );
  @override
  List<Object?> get props => [id, title, author, duration, urlMp3, imagePath];
}
