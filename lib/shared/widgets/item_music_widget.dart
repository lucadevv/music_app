import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app/features/play/ui/screen/play_screen.dart';
import 'package:music_app/shared/const/app_color.dart';

class ItemMusicWidget extends StatelessWidget {
  const ItemMusicWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 60,
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bye Bye",
                    style: textTheme.displayLarge!.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "Mashmello",
                    style: textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "3.58",
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
                onTap: () {
                  context.goNamed(PlayScreen.name);
                },
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
