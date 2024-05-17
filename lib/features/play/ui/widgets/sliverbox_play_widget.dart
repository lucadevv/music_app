import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/features/playslist/domain/entities/track_entity.dart';
import 'package:music_app/features/playslist/ui/bloc/reproductor/reproductor_bloc.dart';
import 'package:music_app/shared/const/app_color.dart';
import 'package:music_app/shared/const/svg_icon.dart';

class SliverBoxPlayWidget extends StatelessWidget {
  const SliverBoxPlayWidget({
    super.key,
    required this.item,
  });
  final TrackEntity item;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<ReproductorBloc, ReproductorState>(
      builder: (context, state) {
        double progresss = state.currentPosition.inMilliseconds.toDouble() /
            (state.totalDuration.inMilliseconds.toDouble() + 1);

        return SliverToBoxAdapter(
          child: SizedBox(
            height: size.height * 0.5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item.author,
                        style: textTheme.displayMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Column(
                    children: [
                      LinearProgressIndicator(
                        value: progresss,
                        color: AppColors.purpleOne,
                        backgroundColor: Colors.grey[300],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formatDuration(state.currentPosition),
                            style: textTheme.displayMedium,
                          ),
                          Text(
                            formatDuration(state.totalDuration),
                            //item.duration.toString(),
                            style: textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        IconSvg.aleatorio,
                      ),
                      SvgPicture.asset(
                        IconSvg.skipBack,
                      ),
                      InkWell(
                        onTap: () {
                          context
                              .read<ReproductorBloc>()
                              .add(const PlayerToggleEvent());
                        },
                        child: SvgPicture.asset(
                          state.isPlaying ? IconSvg.pauseBtn : IconSvg.playBtn,
                        ),
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
