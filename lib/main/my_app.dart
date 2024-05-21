import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/config/routes/app_routes.dart';
import 'package:music_app/features/home/data/memory/datasource_memorydb_home.dart';
import 'package:music_app/features/home/data/repository/favorite_music_repository_impl.dart';
import 'package:music_app/features/home/ui/bloc/favorite_music/favorite_music_bloc.dart';
import 'package:music_app/features/playslist/ui/bloc/player/player_bloc.dart';
import 'package:music_app/shared/theme/dark_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => PlayerBloc(),
        ),
        BlocProvider(
          create: (context) => FavoriteMusicBloc(
            favoriteMusicRepository: FavoriteMusicRepositoryImpl(
              datasourceMemorydbHome: DatasourceMemorydbHome(),
            ),
          )..add(const FetchAllFavoriteMusicEvent()),
        )
      ],
      child: MaterialApp.router(
        routerConfig: appRoutes,
        title: 'App Music',
        theme: darkTheme,
      ),
    );
  }
}
