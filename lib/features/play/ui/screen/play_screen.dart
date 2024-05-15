import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/shared/const/svg_icon.dart';
import 'package:music_app/shared/widgets/backdropfilter_widget.dart';

class PlayScreen extends StatelessWidget {
  static const name = "play_screen";
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Image.network(
              "https://mrwallpaper.com/images/thumbnail/alan-walker-poster-yazitmrmam8u88tj.jpg",
              fit: BoxFit.cover,
            ),
            const BackdropFilterWidget(
              sgx: 10,
              sgy: 10,
            ),
            SizedBox(
              height: size.height,
              width: size.width,
              child: CustomScrollView(
                slivers: [
                  const SliverAppbarPlayWidget(),
                  SliverToBoxAdapter(
                    child: Expanded(
                      child: SizedBox(
                        height: size.height * 0.5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const LinearProgressIndicator(
                                value: 0.3,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "1:24",
                                    style: textTheme.displayMedium,
                                  ),
                                  Text(
                                    "3:20",
                                    style: textTheme.displayMedium,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 18),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    IconSvg.aleatorio,
                                  ),
                                  SvgPicture.asset(
                                    IconSvg.skipBack,
                                  ),
                                  SvgPicture.asset(
                                    IconSvg.pauseBtn,
                                  ),
                                  SvgPicture.asset(
                                    IconSvg.skipBorward,
                                  ),
                                  SvgPicture.asset(
                                    IconSvg.repeat,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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

class SliverAppbarPlayWidget extends StatelessWidget {
  const SliverAppbarPlayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      floating: true,
      pinned: true,
      expandedHeight: size.height * 0.5,
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
          alignment: Alignment.center,
          child: Container(
            width: size.width * 0.7,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://mrwallpaper.com/images/thumbnail/alan-walker-poster-yazitmrmam8u88tj.jpg",
                ),
              ),
              color: Colors.indigo,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(150),
                bottomRight: Radius.circular(150),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
