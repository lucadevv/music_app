import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/config/routes/app_routes.dart';
import 'package:music_app/features/playslist/data/network/datasource/datasource_ntw.dart';
import 'package:music_app/features/playslist/data/repository/play_list_screen_repository_impl.dart';
import 'package:music_app/features/playslist/ui/bloc/play_list/playlist_bloc.dart';
import 'package:music_app/features/playslist/ui/bloc/player/player_bloc.dart';
import 'package:music_app/shared/theme/dark_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => PlayerBloc(),
      child: MaterialApp.router(
        routerConfig: appRoutes,
        title: 'Flutter Demo',
        theme: darkTheme,
      ),
    );
  }
}
