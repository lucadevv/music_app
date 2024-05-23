import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/features/home/ui/bloc/player_favorite_music/player_favorite_music_bloc.dart';
import 'package:music_app/features/playslist/ui/bloc/play_list/playlist_bloc.dart';
import 'package:music_app/features/playslist/ui/bloc/player/player_bloc.dart';
import 'package:music_app/shared/widgets/item_music_widget.dart';
import 'package:music_app/shared/widgets/linear_loading_widget.dart';
import 'package:shimmer/shimmer.dart';

class SliverListWidget extends StatefulWidget {
  const SliverListWidget({
    super.key,
  });

  @override
  State<SliverListWidget> createState() => _SliverListWidgetState();
}

class _SliverListWidgetState extends State<SliverListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistBloc, PlaylistState>(
      builder: (context, state) {
        if (state.playListStatus == PlayListStatus.loading) {
          return const SliverListLoadingWidget();
        } else if (state.playListStatus == PlayListStatus.sucess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = state.playList.trackList[index];
                final music = context.watch<PlayerBloc>().state.currentTrack;
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 12, right: 16, left: 16),
                  child: ItemMusicWidget(
                    trackEntity: item,
                    isSelect: music.id == item.id,
                    ontap: () {
                      context
                          .read<PlayerFavoriteMusicBloc>()
                          .add(StopFavoriteEvent());
                      context.read<PlayerBloc>()
                        ..add(FetcTracksEvent(
                            listModel: state.playList.trackList))
                        ..add(PlayEvent(urlMp3: item.urlMp3, index: index))
                        ..add(FetcTrackIdEvent(model: item));
                    },
                  ),
                );
              },
              childCount: state.playList.trackList.length,
            ),
          );
        } else {
          return const SliverListLoadingWidget();
        }
      },
    );
  }
}

class SliverListLoadingWidget extends StatelessWidget {
  const SliverListLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12, right: 16, left: 16),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.5),
            highlightColor: Colors.white.withOpacity(0.5),
            child: const SizedBox(
              height: 60,
              width: double.infinity,
              child: Row(
                children: [
                  LinearLoadingWidget(height: 60, width: 60),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LinearLoadingWidget(height: 13, width: 150),
                        SizedBox(height: 6),
                        LinearLoadingWidget(height: 8, width: 100),
                      ],
                    ),
                  ),
                  Spacer(),
                  LinearLoadingWidget(height: 20, width: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
