import 'package:equatable/equatable.dart';
import 'package:music_app/features/home/data/network/model/playlist_model/playlist_model_db.dart';

class RecentListHomeEntity extends Equatable {
  final int id;
  final String title;
  final String decription;
  final String creator;
  final String imagePath;

  const RecentListHomeEntity({
    required this.id,
    required this.title,
    required this.decription,
    required this.creator,
    required this.imagePath,
  });
  factory RecentListHomeEntity.fromJson(Map<String, dynamic> json) =>
      RecentListHomeEntity(
        id: json['id'],
        title: json['title'],
        decription: json['decription'],
        creator: json['creator'],
        imagePath: json['picture_medium'],
      );

  factory RecentListHomeEntity.fromModelDb(PlayListModelDb db) =>
      RecentListHomeEntity(
        id: db.id,
        title: db.title,
        decription: db.description,
        creator: db.creator.name,
        imagePath: db.pictureMedium,
      );

  RecentListHomeEntity copyWith({
    int? id,
    String? title,
    String? decription,
    String? creator,
    String? imagePath,
  }) =>
      RecentListHomeEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        decription: decription ?? this.decription,
        creator: creator ?? this.creator,
        imagePath: imagePath ?? this.imagePath,
      );

  @override
  List<Object?> get props => [id, title, decription, creator, imagePath];
}
