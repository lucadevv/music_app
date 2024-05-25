import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/features/artist/ui/bloc/artist/artist_bloc.dart';
import 'package:music_app/shared/bloc/player/player_bloc.dart';
import 'package:music_app/shared/entity_global/track_global_entity.dart';
import 'package:music_app/shared/widgets/item_music_widget.dart';

class ArtistSliverList extends StatelessWidget {
  const ArtistSliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtistBloc, ArtistState>(
      builder: (context, state) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: state.list.length,
            (context, index) {
              final itemGlobal =
                  TrackGloablEntity.fromArtisTrackEntity(state.list[index]);
              final listGlobal = state.list.map((e) {
                return TrackGloablEntity.fromArtisTrackEntity(e);
              }).toList();
              final music = context.watch<PlayerBloc>().state.currentTrack;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12, right: 16, left: 16),
                child: ItemMusicWidget(
                  trackEntity: itemGlobal,
                  ontap: () {
                    context.read<PlayerBloc>()
                      ..add(FetcTracksEvent(listModel: listGlobal))
                      ..add(PlayEvent(urlMp3: itemGlobal.urlMp3, index: index))
                      ..add(FetcTrackIdEvent(model: itemGlobal));
                  },
                  isSelect: itemGlobal.id == music.id,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
