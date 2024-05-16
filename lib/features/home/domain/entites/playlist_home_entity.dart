import 'package:equatable/equatable.dart';
import 'package:music_app/features/home/data/network/model/playlist_model_db.dart';

class PlayListHomeEntity extends Equatable {
  final int id;
  final String title;
  final String decription;
  final String creator;
  final String imagePath;

  const PlayListHomeEntity({
    required this.id,
    required this.title,
    required this.decription,
    required this.creator,
    required this.imagePath,
  });
  factory PlayListHomeEntity.fromJson(Map<String, dynamic> json) =>
      PlayListHomeEntity(
        id: json['id'],
        title: json['title'],
        decription: json['decription'],
        creator: json['creator'],
        imagePath: json['picture_medium'],
      );

  factory PlayListHomeEntity.fromModelDb(PlayListModelDb db) =>
      PlayListHomeEntity(
        id: db.id,
        title: db.title,
        decription: db.description,
        creator: db.creator.name,
        imagePath: db.pictureMedium,
      );

  PlayListHomeEntity copyWith({
    int? id,
    String? title,
    String? decription,
    String? creator,
    String? imagePath,
  }) =>
      PlayListHomeEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        decription: decription ?? this.decription,
        creator: creator ?? this.creator,
        imagePath: imagePath ?? this.imagePath,
      );

  @override
  List<Object?> get props => [id, title, decription, creator, imagePath];
}
