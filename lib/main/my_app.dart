import 'package:flutter/material.dart';
import 'package:music_app/config/routes/app_routes.dart';

import 'package:music_app/shared/theme/dark_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRoutes,
      title: 'Flutter Demo',
      theme: darkTheme,
    );
  }
}
