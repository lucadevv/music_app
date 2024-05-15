import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/shared/const/app_color.dart';
import 'package:music_app/shared/const/svg_icon.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search song, playslist, artisr...',
        hintStyle: textTheme.displayMedium,
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        filled: true,
        fillColor: AppColors.greyOne,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: SvgPicture.asset(
            IconSvg.search,
            height: 20,
            colorFilter: const ColorFilter.mode(
              AppColors.greyTown,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
