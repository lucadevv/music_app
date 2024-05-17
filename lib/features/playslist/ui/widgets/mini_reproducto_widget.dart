import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app/features/play/ui/screen/play_screen.dart';
import 'package:music_app/features/playslist/ui/bloc/play_list/playlist_bloc.dart';
import 'package:music_app/shared/const/app_color.dart';
import 'package:music_app/shared/const/svg_icon.dart';

class MiniReproductorWidget extends StatelessWidget {
  const MiniReproductorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<PlaylistBloc, PlaylistState>(
      builder: (context, state) {
        final model = state.trackEntity;
        return SizedBox(
          height: size.height * 0.1,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LinearProgressIndicator(
                  value: 0.3,
                  color: AppColors.purpleOne,
                  backgroundColor: Colors.grey[300],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context.pushNamed(PlayScreen.name, extra: model);
                      },
                      child: model.imagePath.isNotEmpty
                          ? Container(
                              height: size.height * 0.05,
                              width: size.height * 0.05,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    model.imagePath,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            )
                          : Container(
                              height: size.height * 0.05,
                              width: size.height * 0.05,
                              decoration: BoxDecoration(
                                color: AppColors.greyTown,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.title,
                            maxLines: 1,
                            style: textTheme.displayLarge!.copyWith(
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            model.author,
                            style: textTheme.displayMedium!.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        IconSvg.playBtn,
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
