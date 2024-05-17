import 'package:go_router/go_router.dart';
import 'package:music_app/features/home/ui/screen/home_screen.dart';
import 'package:music_app/features/playslist/ui/screen/playslist_screen.dart';
import 'package:music_app/features/splash/ui/screen/splahs_screen.dart';

final appRoutes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: SplashScreen.name,
      builder: (context, state) => const SplashScreen(),
      routes: [
        GoRoute(
          path: HomeScreen.name,
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              name: PlaysListScreen.name,
              path: PlaysListScreen.name,
              builder: (context, state) {
                final id = int.parse(state.extra.toString());
                return PlaysListScreen(id: id);
              },
            ),
          ],
        )
      ],
    ),
  ],
);
