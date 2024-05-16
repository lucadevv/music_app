import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/features/playslist/ui/bloc/play_list/playlist_bloc.dart';
import 'package:music_app/shared/widgets/item_music_widget.dart';

class SliverListWidget extends StatelessWidget {
  const SliverListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistBloc, PlaylistState>(
      builder: (context, state) {
        return SliverList.builder(
          itemCount: state.playList.trackList.length,
          itemBuilder: (context, index) {
            final item = state.playList.trackList[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 12, right: 16, left: 16),
              child: ItemMusicWidget(
                author: item.author,
                title: item.title,
                duration: item.duration,
              ),
            );
          },
        );
      },
    );
  }
}
