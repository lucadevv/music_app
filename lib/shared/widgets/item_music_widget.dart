import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app/features/play/ui/screen/play_screen.dart';
import 'package:music_app/shared/const/app_color.dart';

class ItemMusicWidget extends StatelessWidget {
  const ItemMusicWidget({
    super.key,
    this.image = '',
    this.author = '',
    this.duration = 0,
    this.title = '',
  });
  final String image;
  final String title;
  final String author;
  final int duration;
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
                  image: DecorationImage(
                    image: image.isNotEmpty
                        ? NetworkImage(image)
                        : const NetworkImage(
                            "https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg",
                          ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.displayLarge!.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    author,
                    style: textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                duration.toString(),
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
