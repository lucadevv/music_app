import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/features/home/domain/entites/your_favorite_music_entity.dart';
import 'package:music_app/features/home/ui/bloc/favorite_music/favorite_music_bloc.dart';
import 'package:music_app/features/playslist/domain/entities/track_entity.dart';
import 'package:music_app/shared/const/app_color.dart';
import 'package:music_app/shared/const/svg_icon.dart';
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
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: ontap,
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
                ),
              ),
              BlocBuilder<FavoriteMusicBloc, FavoriteMusicState>(
                builder: (context, state) {
                  final isFavorite = state.favoriteListMusic
                      .any((favorite) => favorite.track.id == trackEntity.id);
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          if (isFavorite) {
                            context.read<FavoriteMusicBloc>().add(
                                RemoveFavoriteMusicEvent(
                                    model: YourFavoriteMusicEntity(
                                        isFavorite: false,
                                        track: trackEntity)));
                          } else {
                            context.read<FavoriteMusicBloc>()
                              ..add(
                                AddFavoriteMusicEvent(
                                  model: YourFavoriteMusicEntity(
                                      isFavorite: true, track: trackEntity),
                                ),
                              )
                              ..add(const FetchAllFavoriteMusicEvent());
                          }
                        },
                        child: SvgPicture.asset(
                          IconSvg.favorite,
                          height: 18,
                          colorFilter: ColorFilter.mode(
                            isFavorite ? Colors.red : Colors.grey,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 8),
              Text(
                formatDuration(trackEntity.duration),
                style: textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.normal,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          // Material(
          //   color: Colors.transparent,
          //   child: InkWell(
          //     onTap: ontap,
          //     child: Container(
          //       color: Colors.transparent,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  String formatDuration(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
