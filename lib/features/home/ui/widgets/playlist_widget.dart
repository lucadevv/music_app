import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app/features/playslist/ui/screen/playslist_screen.dart';

class PlayListhWidget extends StatelessWidget {
  const PlayListhWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 270,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: 224,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 202,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              context.goNamed(PlaysListScreen.name);
                            },
                            child: Container(
                              height: 202,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "R&B Playlists",
                  style: textTheme.displayLarge!.copyWith(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Chill your mind",
                  style: textTheme.displayMedium,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
