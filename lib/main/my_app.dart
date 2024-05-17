import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/config/routes/app_routes.dart';
import 'package:music_app/features/playslist/ui/bloc/player/player_bloc.dart';
import 'package:music_app/shared/theme/dark_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => PlayerBloc(),
      child: MaterialApp.router(
        routerConfig: appRoutes,
        title: 'App Music',
        theme: darkTheme,
      ),
    );
  }
}
