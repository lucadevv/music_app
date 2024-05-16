import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/shared/const/svg_icon.dart';

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
