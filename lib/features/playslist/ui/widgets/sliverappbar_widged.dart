import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/features/playslist/ui/bloc/play_list/playlist_bloc.dart';
import 'package:music_app/shared/const/svg_icon.dart';
import 'package:music_app/shared/widgets/circle_loading_widget.dart';
import 'package:music_app/shared/widgets/linear_loading_widget.dart';

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
        if (state.playListStatus == PlayListStatus.loading) {
          return SliverAppbarLoadingWidget(size: size);
        } else if (state.playListStatus == PlayListStatus.sucess) {
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
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4),
                        BlendMode.darken,
                      )),
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
                                state.playList.title,
                                style: textTheme.bodyMedium,
                              ),
                              Text(
                                state.playList.author,
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
        } else {
          return SliverAppbarLoadingWidget(size: size);
        }
      },
    );
  }
}

class SliverAppbarLoadingWidget extends StatelessWidget {
  const SliverAppbarLoadingWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
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
            color: Colors.black.withOpacity(0.7),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 48),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LinearLoadingWidget(height: 20, width: 150),
                        SizedBox(height: 10),
                        LinearLoadingWidget(height: 10, width: 100),
                      ],
                    ),
                    Spacer(),
                    CircleLoadingWidget(height: 40, width: 40),
                    SizedBox(width: 12),
                    CircleLoadingWidget(height: 60, width: 60)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
