import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/features/playslist/domain/entities/track_entity.dart';
import 'package:music_app/shared/const/app_color.dart';
import 'package:music_app/shared/const/svg_icon.dart';

class SliverBoxPlayWidget extends StatefulWidget {
  const SliverBoxPlayWidget({
    super.key,
    required this.item,
  });
  final TrackEntity item;

  @override
  State<SliverBoxPlayWidget> createState() => _SliverBoxPlayWidgetState();
}

class _SliverBoxPlayWidgetState extends State<SliverBoxPlayWidget> {
  late AudioPlayer audioPlayer;
  Duration currentDuration = Duration.zero;
  Duration totalDuration = Duration.zero;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayer.setSourceUrl(widget.item.urlMp3);
    audioPlayer.onDurationChanged.listen((newDuration) {
      totalDuration = newDuration;
    });

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void togglePlay() async {
    if (isPlaying) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.resume();
    }
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes);
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
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
                    widget.item.title,
                    style: textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.item.author,
                    style: textTheme.displayMedium,
                  ),
                ],
              ),
              const SizedBox(height: 18),
              StreamBuilder<Duration>(
                stream: audioPlayer.onPositionChanged,
                builder: (context, snapshot) {
                  print("--------$totalDuration");
                  final currentDuration = snapshot.data ?? Duration.zero;
                  double progress = currentDuration.inMilliseconds.toDouble() /
                      (totalDuration.inMilliseconds.toDouble() + 1);

                  return Column(
                    children: [
                      LinearProgressIndicator(
                        value: progress,
                        color: AppColors.purpleOne,
                        backgroundColor: Colors.grey[300],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formatDuration(currentDuration),
                            style: textTheme.displayMedium,
                          ),
                          Text(
                            formatDuration(totalDuration),
                            //item.duration.toString(),
                            style: textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ],
                  );
                },
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
                    onTap: togglePlay,
                    child: SvgPicture.asset(
                      isPlaying ? IconSvg.pauseBtn : IconSvg.playBtn,
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
  }
}
