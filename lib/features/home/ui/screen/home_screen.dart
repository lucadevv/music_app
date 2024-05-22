import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/features/home/data/network/datasource/datasource_ntw.dart';
import 'package:music_app/features/home/data/repository/playlist_home_repository_impl.dart';
import 'package:music_app/features/home/data/repository/search_repository_impl.dart';
import 'package:music_app/features/home/ui/bloc/home/home_bloc.dart';

import 'package:music_app/features/home/ui/bloc/search/search_bloc.dart';
import 'package:music_app/features/home/ui/widgets/appbar_home_widget.dart';
import 'package:music_app/features/home/ui/widgets/category_widget.dart';
import 'package:music_app/features/home/ui/widgets/playlist_widget.dart';
import 'package:music_app/features/home/ui/widgets/search_widget.dart';
import 'package:music_app/features/home/ui/widgets/yourfavorite_widget.dart';
import 'package:music_app/features/playslist/domain/entities/track_entity.dart';
import 'package:music_app/features/playslist/ui/bloc/player/player_bloc.dart';
import 'package:music_app/features/playslist/ui/widgets/mini_reproducto_widget.dart';

import 'package:music_app/shared/widgets/backdropfilter_widget.dart';
import 'package:music_app/shared/widgets/ellipse_widget.dart';
import 'package:music_app/shared/widgets/item_music_widget.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home_screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => HomeBloc(
            playListHomeRepository: PlayListHomeRepositoryImpl(
              datasourceNtwBdHome: DatasourceNtwBdHome(),
            ),
          )..add(const FetchPlayListHomeEvent()),
        ),
        BlocProvider(
          create: (context) => SearchBloc(
            searchMusicRepository: SearchRepositoryImpl(
                datasourceNtwBdHome: DatasourceNtwBdHome()),
          ),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const ElippseWidget(
                  height: 450,
                  width: 450,
                  right: 120,
                  left: 0,
                  top: 0,
                  bottom: 0,
                ),
                const BackdropFilterWidget(sgx: 200, sgy: 200),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: size.height,
                    width: size.width,
                    child: Column(
                      children: [
                        AppbarHomeWidget(textTheme: textTheme),
                        const SizedBox(height: 32),
                        const SearchWidget(),
                        const SizedBox(height: 48),
                        BlocBuilder<SearchBloc, SearchState>(
                          builder: (context, state) {
                            if (state.status == SearchStatus.initial) {
                              return Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      const CategoryWidget(),
                                      const SizedBox(height: 24),
                                      const PlayListhWidget(),
                                      const SizedBox(height: 48),
                                      const YourFavoriteWidget(),
                                      BlocBuilder<PlayerBloc, PlayerState>(
                                        builder: (context, state) {
                                          return Container(
                                            height: state.reproductorStatus ==
                                                    ReproductorStatus.initial
                                                ? size.height * 0.0
                                                : size.height * 0.1,
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              );
                            } else if (state.status == SearchStatus.loading) {
                              return const CircularProgressIndicator();
                            } else if (state.status == SearchStatus.sucess) {
                              return Expanded(
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: state.searchList.length,
                                  itemBuilder: (context, index) {
                                    final item = TrackEntity.fromModel(
                                        state.searchList[index]);

                                    List<TrackEntity> trackEntities = state
                                        .searchList
                                        .map((model) =>
                                            TrackEntity.fromModel(model))
                                        .toList();
                                    context.read<PlayerBloc>().add(
                                        FetcTracksEvent(
                                            listModel: trackEntities));
                                    final currentMusicPlaying = context
                                        .watch<PlayerBloc>()
                                        .state
                                        .currentTrack;
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 12),
                                      child: ItemMusicWidget(
                                        trackEntity: item,
                                        ontap: () {
                                          context.read<PlayerBloc>()
                                            ..add(PlayEvent(
                                                urlMp3: item.urlMp3,
                                                index: index))
                                            ..add(
                                                FetcTrackIdEvent(model: item));
                                        },
                                        isSelect:
                                            currentMusicPlaying.id == item.id,
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else {
                              return Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      const CategoryWidget(),
                                      const SizedBox(height: 24),
                                      const PlayListhWidget(),
                                      const SizedBox(height: 48),
                                      const YourFavoriteWidget(),
                                      BlocBuilder<PlayerBloc, PlayerState>(
                                        builder: (context, state) {
                                          return Container(
                                            height: state.reproductorStatus ==
                                                    ReproductorStatus.initial
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
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<PlayerBloc, PlayerState>(
                  builder: (context, state) {
                    if (state.reproductorStatus == ReproductorStatus.initial) {
                      return const SizedBox();
                    } else {
                      return Align(
                        alignment: const AlignmentDirectional(0, 1),
                        child: SizedBox(
                          height: size.height * 0.1,
                          width: size.width,
                          child: const Stack(
                            children: [
                              ClipRRect(
                                child: BackdropFilterWidget(
                                  sgx: 100,
                                  sgy: 100,
                                ),
                              ),
                              MiniReproductorWidget(),
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
      ),
    );
  }
}
