import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/features/playslist/ui/bloc/player/player_bloc.dart';
import 'package:music_app/features/playslist/ui/modal/show_music_modal.dart';
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

    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        final model = state.currentTrack;
        double progresss = state.currentPosition.inMilliseconds.toDouble() /
            (state.totalPosition.inMilliseconds.toDouble() + 1);
        return Container(
          height: size.height * 0.1,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.9),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LinearProgressIndicator(
                  value: progresss,
                  color: AppColors.purpleOne,
                  backgroundColor: Colors.grey[300],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const ShowModalMusic();
                          },
                        );
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
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const ShowModalMusic();
                            },
                          );
                        },
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
                    ),
                    Text(formatDuration(state.currentPosition)),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        context.read<PlayerBloc>().add(ToggleEnvet());
                      },
                      child: SvgPicture.asset(
                        state.reproductorStatus == ReproductorStatus.play
                            ? IconSvg.pauseBtn
                            : IconSvg.playBtn,
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

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes);
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
