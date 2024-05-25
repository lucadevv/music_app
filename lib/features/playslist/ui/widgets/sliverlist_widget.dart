import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/features/playslist/ui/bloc/play_list/playlist_bloc.dart';
import 'package:music_app/features/playslist/ui/widgets/sliver_list_loading_widget.dart';
import 'package:music_app/shared/bloc/player/player_bloc.dart';
import 'package:music_app/shared/entity_global/track_global_entity.dart';
import 'package:music_app/shared/widgets/item_music_widget.dart';

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
                final listGlobal = state.playList.trackList.map((e) {
                  return TrackGloablEntity.trackEntity(e);
                }).toList();
                final itemGlobal = TrackGloablEntity.trackEntity(
                    state.playList.trackList[index]);

                final music = context.watch<PlayerBloc>().state.currentTrack;
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 12, right: 16, left: 16),
                  child: ItemMusicWidget(
                    trackEntity: itemGlobal,
                    isSelect: music.id == itemGlobal.id,
                    ontap: () {
                      context.read<PlayerBloc>()
                        ..add(FetcTracksEvent(listModel: listGlobal))
                        ..add(
                            PlayEvent(urlMp3: itemGlobal.urlMp3, index: index))
                        ..add(FetcTrackIdEvent(model: itemGlobal));
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
