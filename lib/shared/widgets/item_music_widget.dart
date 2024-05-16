import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app/features/play/ui/screen/play_screen.dart';
import 'package:music_app/features/playslist/domain/entities/track_entity.dart';
import 'package:music_app/shared/const/app_color.dart';

class ItemMusicWidget extends StatelessWidget {
  const ItemMusicWidget({
    super.key,
    required this.trackEntity,
  });

  final TrackEntity trackEntity;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 60,
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: trackEntity.imagePath.isNotEmpty
                        ? NetworkImage(trackEntity.imagePath)
                        : const NetworkImage(
                            "https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg",
                          ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trackEntity.title,
                      maxLines: 1,
                      style: textTheme.displayLarge!.copyWith(
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      trackEntity.author,
                      style: textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                trackEntity.duration.toString(),
                style: textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.normal,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  context.pushNamed(PlayScreen.name, extra: trackEntity);
                  // context.goNamed(PlayScreen.name, extra: 10);
                },
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
