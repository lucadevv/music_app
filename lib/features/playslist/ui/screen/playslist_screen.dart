import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/features/playslist/data/network/datasource/datasource_ntw.dart';
import 'package:music_app/features/playslist/data/repository/play_list_screen_repository_impl.dart';
import 'package:music_app/features/playslist/ui/bloc/play_list/playlist_bloc.dart';
import 'package:music_app/features/playslist/ui/bloc/player/player_bloc.dart';
import 'package:music_app/features/playslist/ui/widgets/mini_reproducto_widget.dart';
import 'package:music_app/features/playslist/ui/widgets/sliverappbar_widged.dart';
import 'package:music_app/features/playslist/ui/widgets/sliverlist_widget.dart';

class PlaysListScreen extends StatelessWidget {
  static const name = "playslist_screen";
  const PlaysListScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      lazy: false,
      create: (context) => PlaylistBloc(
        PlayListScreenRepositorImpl(
          datasourcePlayListNtwDb: DatasourcePlayListNtwDb(),
        ),
      )..add(const FetchPlayListEvent()),
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // const ElippseWidget(
              //   height: 10,
              //   width: 10,
              //   right: 0,
              //   left: 0,
              //   top: -300,
              //   bottom: 250,
              // ),
              // const ElippseWidget(
              //   height: 10,
              //   width: 10,
              //   right: 0,
              //   left: 0,
              //   top: 500,
              //   bottom: -500,
              // ),
              // const BackdropFilterWidget(
              //   sgx: 200,
              //   sgy: 200,
              // ),
              SizedBox(
                height: size.height,
                width: size.width,
                child: CustomScrollView(
                  slivers: [
                    const SliverAppbarWidget(),
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 12),
                    ),
                    const SliverListWidget(),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: size.height * 0.1,
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<PlayerBloc, PlayerState>(
                builder: (context, state) {
                  if (state.reproductorStatus == ReproductorStatus.initial) {
                    return const SizedBox();
                  } else {
                    return Align(
                      alignment: const AlignmentDirectional(0, 1),
                      child: AnimatedContainer(
                        height: size.height * 0.1,
                        width: size.width,
                        duration: const Duration(milliseconds: 1000),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.9),
                              ),
                            ),
                            const MiniReproductorWidget(),
                          ],
                        ),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
