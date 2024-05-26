import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app/features/artist/ui/bloc/artist/artist_bloc.dart';
import 'package:music_app/features/artist/ui/screen/artist_screen.dart';
import 'package:music_app/features/home/ui/bloc/download/download_bloc.dart';
import 'package:music_app/shared/bloc/player/player_bloc.dart';
import 'package:music_app/shared/const/app_color.dart';
import 'package:music_app/shared/const/svg_icon.dart';
import 'package:music_app/shared/database_service/models/music_localdb.dart';
import 'package:music_app/shared/widgets/linear_loading_widget.dart';
import 'package:shimmer/shimmer.dart';

class ShowModalMusic extends StatelessWidget {
  const ShowModalMusic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, statePlayer) {
        final modelPlayer = statePlayer.currentTrack;
        final idArtist = modelPlayer.artistGlobalEntity.id;
        return BlocBuilder<DownloadBloc, DownloadState>(
          builder: (context, stateDownload) {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6),
                      BlendMode.darken,
                    ),
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        key: UniqueKey(),
                        imageUrl: modelPlayer.imagePath,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.black.withOpacity(0.5),
                          highlightColor: Colors.black.withOpacity(0.5),
                          child:
                              const LinearLoadingWidget(height: 60, width: 60),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
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
                              image: NetworkImage(modelPlayer.imagePath),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  modelPlayer.title,
                                  style: textTheme.bodyMedium,
                                ),
                                IconButton(
                                  onPressed: () {
                                    context.read<DownloadBloc>().add(
                                          InserMusicDownloadEvent(
                                            musicLocalDb: MusicLocalDb
                                                .fromTrackGloablEntity(
                                              modelPlayer,
                                            ),
                                          ),
                                        );
                                  },
                                  icon: const Icon(
                                    Icons.download_for_offline,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 6),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  context.read<ArtistBloc>()
                                    ..add(FetchArtist(id: idArtist))
                                    ..add(FetchListMusicArtist(
                                        urlPath: modelPlayer
                                            .artistGlobalEntity.trackList));
                                  context.pushNamed(ArtistScreen.name);
                                },
                                child: Text(
                                  modelPlayer.artistGlobalEntity.name,
                                  style: textTheme.displayMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Column(
                          children: [
                            Slider(
                              value: statePlayer.currentPosition.inSeconds
                                  .toDouble(),
                              min: 0,
                              max: statePlayer.totalPosition.inSeconds
                                  .toDouble(),
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
                                  formatDuration(statePlayer.currentPosition),
                                  style: textTheme.displayMedium,
                                ),
                                Text(
                                  formatDuration(statePlayer.totalPosition),
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
                                statePlayer.reproductorStatus ==
                                        ReproductorStatus.play
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
