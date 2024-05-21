import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/features/home/data/network/datasource/datasource_ntw.dart';
import 'package:music_app/features/home/data/repository/playlist_home_repository_impl.dart';
import 'package:music_app/features/home/ui/bloc/home/home_bloc.dart';
import 'package:music_app/features/home/ui/widgets/appbar_home_widget.dart';
import 'package:music_app/features/home/ui/widgets/category_widget.dart';
import 'package:music_app/features/home/ui/widgets/playlist_widget.dart';
import 'package:music_app/features/home/ui/widgets/search_widget.dart';
import 'package:music_app/features/home/ui/widgets/yourfavorite_widget.dart';
import 'package:music_app/features/playslist/ui/bloc/player/player_bloc.dart';
import 'package:music_app/features/playslist/ui/widgets/mini_reproducto_widget.dart';

import 'package:music_app/shared/widgets/backdropfilter_widget.dart';
import 'package:music_app/shared/widgets/ellipse_widget.dart';

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
      ],
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
                      const CategoryWidget(),
                      const SizedBox(height: 24),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
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
    );
  }
}
