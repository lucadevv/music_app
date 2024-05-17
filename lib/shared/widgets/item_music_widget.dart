import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_app/features/playslist/domain/entities/track_entity.dart';
import 'package:music_app/shared/const/app_color.dart';
import 'package:music_app/shared/widgets/linear_loading_widget.dart';
import 'package:shimmer/shimmer.dart';

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
      duration: const Duration(milliseconds: 100),
      child: Stack(
        children: [
          Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                height: isSelect ? 80 : 60,
                width: isSelect ? 80 : 60,
                child: CachedNetworkImage(
                  key: UniqueKey(),
                  imageUrl: trackEntity.imagePath,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.5),
                    highlightColor: Colors.white.withOpacity(0.5),
                    child: const LinearLoadingWidget(height: 60, width: 60),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: ontap,
              child: Container(
                color: Colors.transparent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
