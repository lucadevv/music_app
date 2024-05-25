import 'package:equatable/equatable.dart';
import 'package:music_app/shared/entity_global/artist_gobal_entity.dart';
import 'package:music_app/shared/entity_global/track_global_entity.dart';

class YourFavoriteMusicEntity extends Equatable {
  final bool isFavorite;
  final int id;
  final String title;
  final String author;
  final int duration;
  final String urlMp3;
  final String imagePath;
  final ArtistGlobalEntity artistGlobalEntity;

  const YourFavoriteMusicEntity({
    required this.isFavorite,
    required this.id,
    required this.title,
    required this.author,
    required this.duration,
    required this.urlMp3,
    required this.imagePath,
    required this.artistGlobalEntity,
  });

  factory YourFavoriteMusicEntity.empty() {
    return YourFavoriteMusicEntity(
      isFavorite: false,
      id: -1,
      title: "",
      author: "",
      duration: 0,
      urlMp3: "",
      imagePath: "",
      artistGlobalEntity: ArtistGlobalEntity.empty(),
    );
  }
  factory YourFavoriteMusicEntity.trackGlobalEntity(TrackGloablEntity entity) {
    return YourFavoriteMusicEntity(
      isFavorite: true,
      id: entity.id,
      title: entity.title,
      author: entity.artistGlobalEntity.name,
      duration: entity.duration,
      urlMp3: entity.urlMp3,
      imagePath: entity.imagePath,
      artistGlobalEntity: entity.artistGlobalEntity,
    );
  }

  YourFavoriteMusicEntity copyWith({
    bool? isFavorite,
    int? id,
    String? title,
    String? author,
    int? duration,
    String? urlMp3,
    String? imagePath,
    ArtistGlobalEntity? artistGlobalEntity,
  }) =>
      YourFavoriteMusicEntity(
        isFavorite: isFavorite ?? this.isFavorite,
        id: id ?? this.id,
        title: title ?? this.title,
        author: author ?? this.author,
        duration: duration ?? this.duration,
        urlMp3: urlMp3 ?? this.urlMp3,
        imagePath: imagePath ?? this.imagePath,
        artistGlobalEntity: artistGlobalEntity ?? this.artistGlobalEntity,
      );

  @override
  List<Object?> get props => [
        isFavorite,
        id,
        title,
        author,
        duration,
        urlMp3,
        imagePath,
        artistGlobalEntity,
      ];
}
