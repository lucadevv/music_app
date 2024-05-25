import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/features/home/data/network/datasource/datasource_ntw.dart';
import 'package:music_app/features/home/data/repository/playlist_home_repository_impl.dart';
import 'package:music_app/features/home/ui/bloc/home/home_bloc.dart';
import 'package:music_app/features/home/ui/widgets/appbar_home_widget.dart';
import 'package:music_app/features/home/ui/widgets/category_widget.dart';
import 'package:music_app/features/home/ui/widgets/playlist_widget.dart';
import 'package:music_app/features/home/ui/widgets/yourfavorite_widget.dart';
import 'package:music_app/shared/bloc/player/player_bloc.dart';
import 'package:music_app/shared/widgets/mini_reproducto_widget.dart';
import 'package:music_app/shared/const/app_color.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home_screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      lazy: false,
      create: (context) => HomeBloc(
        playListHomeRepository: PlayListHomeRepositoryImpl(
          datasourceNtwBdHome: DatasourceNtwBdHome(),
        ),
      )..add(const FetchPlayListHomeEvent()),
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
                Container(
                  height: 200,
                  width: 200,
                  decoration:
                      const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                      color: AppColors.purpleTown,
                      blurRadius: 100,
                      spreadRadius: 50,
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: size.height,
                    width: size.width,
                    child: Column(
                      children: [
                        AppbarHomeWidget(textTheme: textTheme),
                        const SizedBox(height: 32),
                        Expanded(
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
                        ),
                      ],
                    ),
                  ),
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
        ),
      ),
    );
  }
}
