import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/features/playslist/ui/bloc/play_list/playlist_bloc.dart';
import 'package:music_app/shared/const/svg_icon.dart';

class SliverAppbarWidget extends StatelessWidget {
  const SliverAppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<PlaylistBloc, PlaylistState>(
      builder: (context, state) {
        return SliverAppBar(
          expandedHeight: size.height * 0.3,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SvgPicture.asset(
                IconSvg.moreHorizontal,
              ),
            )
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(state.playList.imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 48),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "R&B Playlist",
                              style: textTheme.bodyMedium,
                            ),
                            Text(
                              "Chill your mind",
                              style: textTheme.displayLarge,
                            ),
                          ],
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          IconSvg.favorite,
                        ),
                        const SizedBox(width: 12),
                        SvgPicture.asset(
                          IconSvg.playBtn,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
