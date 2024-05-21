import 'package:equatable/equatable.dart';
import 'package:music_app/features/playslist/domain/entities/track_entity.dart';

class YourFavoriteMusicEntity extends Equatable {
  final bool isFavorite;
  final TrackEntity track;

  const YourFavoriteMusicEntity({
    required this.isFavorite,
    required this.track,
  });

  const YourFavoriteMusicEntity.empty()
      : isFavorite = false,
        track = const TrackEntity.empty();

  YourFavoriteMusicEntity copyWith({
    bool? isFavorite,
    TrackEntity? track,
  }) =>
      YourFavoriteMusicEntity(
        isFavorite: isFavorite ?? this.isFavorite,
        track: track ?? this.track,
      );

  @override
  List<Object?> get props => [track, isFavorite];
}
