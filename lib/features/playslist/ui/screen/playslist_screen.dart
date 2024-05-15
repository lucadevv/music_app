import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/shared/const/svg_icon.dart';
import 'package:music_app/shared/widgets/backdropfilter_widget.dart';

import 'package:music_app/shared/widgets/ellipse_widget.dart';
import 'package:music_app/shared/widgets/item_music_widget.dart';

class PlaysListScreen extends StatelessWidget {
  static const name = "playslist_screen";
  const PlaysListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const ElippseWidget(
              height: 10,
              width: 10,
              right: 0,
              left: 0,
              top: -300,
              bottom: 250,
            ),
            const ElippseWidget(
              height: 10,
              width: 10,
              right: 0,
              left: 0,
              top: 500,
              bottom: -500,
            ),
            const BackdropFilterWidget(),
            SizedBox(
              height: size.height,
              width: size.width,
              child: CustomScrollView(
                slivers: [
                  const SliverAppbarWidget(),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 12),
                  ),
                  SliverList.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding:
                            EdgeInsets.only(bottom: 12, right: 16, left: 16),
                        child: ItemMusicWidget(),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SliverAppbarWidget extends StatelessWidget {
  const SliverAppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
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
          decoration: const BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.only(
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
  }
}
