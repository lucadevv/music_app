import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/config/routes/app_routes.dart';
import 'package:music_app/features/home/data/memory/datasource_memorydb_home.dart';
import 'package:music_app/features/home/data/network/datasource/datasource_ntw.dart';
import 'package:music_app/features/home/data/repository/favorite_music_repository_impl.dart';
import 'package:music_app/features/home/data/repository/search_repository_impl.dart';
import 'package:music_app/features/home/ui/bloc/favorite_music/favorite_music_bloc.dart';
import 'package:music_app/features/home/ui/bloc/search/search_bloc.dart';
import 'package:music_app/features/playslist/ui/bloc/player/player_bloc.dart';
import 'package:music_app/shared/theme/dark_theme.dart';

class MyApp extends StatelessWidget {
  final AudioPlayer audioPlayer;
  const MyApp({super.key, required this.audioPlayer});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlayerBloc(audioPlayer: audioPlayer),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => FavoriteMusicBloc(
            favoriteMusicRepository: FavoriteMusicRepositoryImpl(
              datasourceMemorydbHome: DatasourceMemorydbHome(),
            ),
          )..add(const FetchAllFavoriteMusicEvent()),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => SearchBloc(
            searchMusicRepository: SearchRepositoryImpl(
                datasourceNtwBdHome: DatasourceNtwBdHome()),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: appRoutes,
        title: 'App Music',
        theme: darkTheme,
      ),
    );
  }
}
