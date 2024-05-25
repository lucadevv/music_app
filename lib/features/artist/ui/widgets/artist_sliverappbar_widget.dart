import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/features/artist/ui/bloc/artist/artist_bloc.dart';
import 'package:music_app/shared/bloc/player/player_bloc.dart';
import 'package:music_app/shared/const/svg_icon.dart';
import 'package:music_app/shared/entity_global/track_global_entity.dart';

class ArtistSliverAppbarWidget extends StatelessWidget {
  const ArtistSliverAppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ArtistBloc, ArtistState>(
      builder: (context, state) {
        final item = state.currentArtist;
        final listGlobal = state.list;
        final firts = TrackGloablEntity.fromArtisTrackEntity(listGlobal.first);
        return SliverAppBar(
          expandedHeight: size.height * 0.3,
          backgroundColor: Colors.transparent,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(item.imageBig),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4),
                      BlendMode.darken,
                    )),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 48),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: textTheme.bodyMedium,
                            ),
                            Text(
                              item.numFan.toString(),
                              style: textTheme.displayLarge,
                            ),
                          ],
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          IconSvg.favorite,
                        ),
                        const SizedBox(width: 12),
                        InkWell(
                          onTap: () {
                            context.read<PlayerBloc>()
                              ..add(ToggleEnvet())
                              ..add(PlayEvent(
                                  urlMp3: listGlobal.first.urlMp3, index: 0))
                              ..add(FetcTrackIdEvent(model: firts));
                          },
                          child: BlocBuilder<PlayerBloc, PlayerState>(
                            builder: (context, state) {
                              return SvgPicture.asset(
                                state.reproductorStatus ==
                                        ReproductorStatus.play
                                    ? IconSvg.pauseBtn
                                    : IconSvg.playBtn,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
