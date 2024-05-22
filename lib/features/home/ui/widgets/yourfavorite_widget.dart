import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/features/home/ui/bloc/favorite_music/favorite_music_bloc.dart';
import 'package:music_app/features/playslist/ui/bloc/player/player_bloc.dart';
import 'package:music_app/features/playslist/ui/widgets/sliverlist_widget.dart';
import 'package:music_app/shared/widgets/item_music_widget.dart';

class YourFavoriteWidget extends StatelessWidget {
  const YourFavoriteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Your favorites",
            style: textTheme.displayLarge!.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: BlocBuilder<FavoriteMusicBloc, FavoriteMusicState>(
              builder: (context, state) {
                if (state.status == FavoriteMusicStatus.loading) {
                  return const SliverListLoadingWidget();
                } else if (state.status == FavoriteMusicStatus.sucess) {
                  if (state.favoriteListMusic.isEmpty) {
                    return const Center(
                      child: Text("Empty List"),
                    );
                  } else {
                    final trackList = state.favoriteListMusic
                        .map((favorite) => favorite.track)
                        .toList();
                    context
                        .read<PlayerBloc>()
                        .add(FetcTracksEvent(listModel: trackList));

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: trackList.length,
                      itemBuilder: (context, index) {
                        final item = trackList[index];
                        final music =
                            context.watch<PlayerBloc>().state.currentTrack;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: ItemMusicWidget(
                            trackEntity: item,
                            ontap: () {
                              if (index == 0) {
                                context.read<PlayerBloc>()
                                  ..add(ToggleEnvet())
                                  ..add(
                                      PlayEvent(urlMp3: item.urlMp3, index: 0))
                                  ..add(
                                      FetcTrackIdEvent(model: trackList.first));
                              } else {
                                context.read<PlayerBloc>()
                                  ..add(PlayEvent(
                                      urlMp3: item.urlMp3, index: index))
                                  ..add(FetcTrackIdEvent(model: item));
                              }
                            },
                            isSelect: item.id == music.id,
                          ),
                        );
                      },
                    );
                  }
                } else {
                  return const Center(
                    child: Text("error"),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
