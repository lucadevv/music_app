import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/features/home/ui/bloc/favorite_music/favorite_music_bloc.dart';
import 'package:music_app/features/home/ui/bloc/home/home_bloc.dart';
import 'package:music_app/features/home/ui/widgets/playlist_widget.dart';
import 'package:music_app/features/home/ui/widgets/yourfavorite_widget.dart';
import 'package:music_app/shared/bloc/player/player_bloc.dart';

class RecentPage extends StatelessWidget {
  const RecentPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HomeBloc>().add(const FetchPlayListHomeEvent());
        context
            .read<FavoriteMusicBloc>()
            .add(const FetchAllFavoriteMusicEvent());
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            const PlayListhWidget(),
            const SizedBox(height: 48),
            const YourFavoriteWidget(),
            BlocBuilder<PlayerBloc, PlayerState>(
              builder: (context, state) {
                return Container(
                  height: state.reproductorStatus == ReproductorStatus.initial
                      ? size.height * 0.0
                      : size.height * 0.1,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
