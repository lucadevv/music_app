import 'package:flutter/material.dart';
import 'package:music_app/features/playslist/domain/entities/track_entity.dart';
import 'package:music_app/shared/const/app_color.dart';

class ItemMusicWidget extends StatelessWidget {
  const ItemMusicWidget({
    super.key,
    required this.trackEntity,
    required this.ontap,
    required this.isSelect,
  });

  final TrackEntity trackEntity;
  final VoidCallback ontap;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AnimatedContainer(
      height: isSelect ? 80 : 60,
      duration: const Duration(milliseconds: 300),
      child: Stack(
        children: [
          Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: isSelect ? 80 : 60,
                width: isSelect ? 80 : 60,
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
                        color: isSelect ? Colors.green : Colors.white,
                        fontWeight:
                            isSelect ? FontWeight.bold : FontWeight.w500,
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
                // onTap: () {
                //   //context.pushNamed(PlayScreen.name, extra: trackEntity);
                // },
                onTap: ontap,
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
