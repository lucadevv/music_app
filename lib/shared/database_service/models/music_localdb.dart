import 'package:equatable/equatable.dart';
import 'package:music_app/shared/entity_global/track_global_entity.dart';

class MusicLocalDb extends Equatable {
  final int id;
  final String title;
  final int duration;
  final String urlPath;
  final String imagePath;
  final String artist;
  final int artistId;
  final String artistList;

  const MusicLocalDb({
    required this.id,
    required this.title,
    required this.duration,
    required this.urlPath,
    required this.imagePath,
    required this.artist,
    required this.artistId,
    required this.artistList,
  });

  MusicLocalDb copyWith({
    int? id,
    String? title,
    int? duration,
    String? urlPath,
    String? imagePath,
    String? artist,
    int? artistId,
    String? artistList,
  }) =>
      MusicLocalDb(
        id: id ?? this.id,
        title: title ?? this.title,
        duration: duration ?? this.duration,
        urlPath: urlPath ?? this.urlPath,
        imagePath: imagePath ?? this.imagePath,
        artist: artist ?? this.artist,
        artistId: artistId ?? this.artistId,
        artistList: artistList ?? this.artistList,
      );
  factory MusicLocalDb.fromMapDb(Map<String, dynamic> map) {
    return MusicLocalDb(
      id: map['id'],
      title: map['title'],
      duration: map['duration'],
      urlPath: map['url'],
      imagePath: map['imagePath'],
      artist: map["artist"],
      artistId: map["artistId"],
      artistList: map["artistList"],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'duration': duration,
      'url': urlPath,
      'imagePath': imagePath,
      'artist': artist,
      'artistId': artistId,
      'artistList': artistList,
    };
  }

  factory MusicLocalDb.fromTrackGloablEntity(TrackGloablEntity et) {
    return MusicLocalDb(
      id: et.id,
      title: et.title,
      duration: et.duration,
      urlPath: et.urlMp3,
      imagePath: et.imagePath,
      artist: et.artistGlobalEntity.name,
      artistId: et.artistGlobalEntity.id,
      artistList: et.artistGlobalEntity.trackList,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        duration,
        urlPath,
        imagePath,
        artist,
        artistId,
        artistList,
      ];
}
