import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/features/home/ui/bloc/download/download_bloc.dart';
import 'package:music_app/shared/bloc/player/player_bloc.dart';
import 'package:music_app/shared/entity_global/track_global_entity.dart';
import 'package:music_app/shared/widgets/item_music_widget.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DownloadBloc, DownloadState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            context.read<DownloadBloc>().add(GetALLMusicDownloadEvent());
          },
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.list.length,
            itemBuilder: (context, index) {
              final item =
                  TrackGloablEntity.fromMusicLocalDb(state.list[index]);
              final listGlobal = state.list.map((e) {
                return TrackGloablEntity.fromMusicLocalDb(e);
              }).toList();
              return ItemMusicWidget(
                trackEntity: item,
                ontap: () {
                  context.read<PlayerBloc>()
                    ..add(FetcTracksEvent(listModel: listGlobal))
                    ..add(PlayEvent(urlMp3: item.urlMp3, index: index))
                    ..add(FetcTrackIdEvent(model: item));
                },
                isSelect: false,
              );
            },
          ),
        );
      },
    );
  }
}
