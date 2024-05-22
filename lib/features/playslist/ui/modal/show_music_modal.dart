import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/features/playslist/ui/bloc/player/player_bloc.dart';
import 'package:music_app/shared/const/app_color.dart';
import 'package:music_app/shared/const/svg_icon.dart';

class ShowModalMusic extends StatelessWidget {
  const ShowModalMusic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        final model = state.currentTrack;
        // double progresss = state.currentPosition.inMilliseconds.toDouble() /
        //     (state.totalPosition.inMilliseconds.toDouble() + 1);
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: Image.network(
                  model.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.greyOne,
                            blurRadius: 8,
                            spreadRadius: 5,
                          )
                        ],
                        image: DecorationImage(
                          image: NetworkImage(model.imagePath),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          style: textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          model.author,
                          style: textTheme.displayMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Column(
                      children: [
                        Slider(
                          value: state.currentPosition.inSeconds.toDouble(),
                          min: 0,
                          max: state.totalPosition.inSeconds.toDouble(),
                          onChanged: (value) {
                            final newPosition =
                                Duration(seconds: value.toInt());
                            context
                                .read<PlayerBloc>()
                                .add(SeekEvent(seek: newPosition));
                          },
                          activeColor: AppColors.purpleTown,
                          thumbColor: AppColors.pink,
                          inactiveColor: AppColors.greyTown,
                        ),
                        // LinearProgressIndicator(
                        //   value: progresss,
                        //   color: AppColors.purpleOne,
                        //   backgroundColor: Colors.grey[300],
                        // ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              formatDuration(state.currentPosition),
                              style: textTheme.displayMedium,
                            ),
                            Text(
                              formatDuration(state.totalPosition),
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
                        InkWell(
                          onTap: () {
                            context.read<PlayerBloc>().add(PreviusEvent());
                          },
                          child: SvgPicture.asset(
                            IconSvg.skipBack,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context.read<PlayerBloc>().add(ToggleEnvet());
                          },
                          child: SvgPicture.asset(
                            state.reproductorStatus == ReproductorStatus.play
                                ? IconSvg.pauseBtn
                                : IconSvg.playBtn,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context.read<PlayerBloc>().add(NextEvent());
                          },
                          child: SvgPicture.asset(
                            IconSvg.skipBorward,
                          ),
                        ),
                        SvgPicture.asset(
                          IconSvg.repeat,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
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
