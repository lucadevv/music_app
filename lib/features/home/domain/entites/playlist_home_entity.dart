import 'package:equatable/equatable.dart';

class PlayListHomeEntity extends Equatable {
  final int id;
  final String title;
  final String decription;
  final String creator;

  const PlayListHomeEntity({
    required this.id,
    required this.title,
    required this.decription,
    required this.creator,
  });
  factory PlayListHomeEntity.fromJson(Map<String, dynamic> json) =>
      PlayListHomeEntity(
        id: json['id'],
        title: json['title'],
        decription: json['decription'],
        creator: json['creator'],
      );

  PlayListHomeEntity copyWith({
    int? id,
    String? title,
    String? decription,
    String? creator,
  }) =>
      PlayListHomeEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        decription: decription ?? this.decription,
        creator: creator ?? this.creator,
      );

  @override
  List<Object?> get props => [id, title, decription, creator];
}
