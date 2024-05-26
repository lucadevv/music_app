import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/features/artist/ui/bloc/artist/artist_bloc.dart';
import 'package:music_app/features/artist/ui/widgets/artist_sliverappbar_widget.dart';
import 'package:music_app/features/artist/ui/widgets/artist_sliverlist_widget.dart';
import 'package:music_app/features/playslist/ui/widgets/sliver_list_loading_widget.dart';
import 'package:music_app/features/playslist/ui/widgets/sliverappbar_widged.dart';
import 'package:music_app/shared/bloc/player/player_bloc.dart';
import 'package:music_app/shared/widgets/mini_reproducto_widget.dart';

class ArtistScreen extends StatelessWidget {
  static const name = "artist_screen";
  const ArtistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomScrollView(
              slivers: [
                const ArtistSliverAppbarWidget(),
                const SliverToBoxAdapter(child: SizedBox(height: 12)),
                BlocBuilder<ArtistBloc, ArtistState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case ArtistStatus.loading:
                        return const SliverListLoadingWidget();
                      case ArtistStatus.success:
                        return const ArtistSliverList();
                      default:
                        return const SliverListLoadingWidget();
                    }
                  },
                ),
                SliverToBoxAdapter(child: SizedBox(height: size.height * 0.1)),
              ],
            ),
            BlocBuilder<PlayerBloc, PlayerState>(
              builder: (context, state) {
                bool isState =
                    state.reproductorStatus == ReproductorStatus.play ||
                        state.reproductorStatus == ReproductorStatus.pause;
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: isState
                      ? const MiniReproductorWidget()
                      : const SizedBox(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
