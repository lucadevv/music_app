import 'package:flutter/material.dart';
import 'package:music_app/features/home/ui/widgets/appbar_home_widget.dart';
import 'package:music_app/features/home/ui/widgets/category_widget.dart';
import 'package:music_app/features/home/ui/widgets/playlist_widget.dart';
import 'package:music_app/features/home/ui/widgets/search_widget.dart';
import 'package:music_app/features/home/ui/widgets/yourfavorite_widget.dart';

import 'package:music_app/shared/widgets/backdropfilter_widget.dart';
import 'package:music_app/shared/widgets/ellipse_widget.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home_screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
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
                    const PlayListhWidget(),
                    const SizedBox(height: 48),
                    const YourFavoriteWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
