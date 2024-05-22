import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/shared/const/app_color.dart';
import 'package:music_app/shared/const/svg_icon.dart';

class AppbarHomeWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarHomeWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, kToolbarHeight, 0, 0),
      height: preferredSize.height,
      width: double.infinity,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back!",
                style: textTheme.bodyMedium,
              ),
              Text(
                "What do you feel like today?",
                style: textTheme.displayMedium,
              )
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              IconSvg.search,
              height: 30,
              colorFilter: const ColorFilter.mode(
                AppColors.greyTown,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
