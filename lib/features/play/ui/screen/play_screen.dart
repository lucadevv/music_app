import 'package:flutter/material.dart';
import 'package:music_app/features/play/ui/widgets/sliverappbar_play_widget.dart';
import 'package:music_app/features/play/ui/widgets/sliverbox_play_widget.dart';
import 'package:music_app/shared/widgets/backdropfilter_widget.dart';

class PlayScreen extends StatelessWidget {
  static const name = "play_screen";
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Image.network(
              "https://mrwallpaper.com/images/thumbnail/alan-walker-poster-yazitmrmam8u88tj.jpg",
              fit: BoxFit.cover,
            ),
            const BackdropFilterWidget(
              sgx: 10,
              sgy: 10,
            ),
            SizedBox(
              height: size.height,
              width: size.width,
              child: const CustomScrollView(
                slivers: [
                  SliverAppbarPlayWidget(),
                  SliverBoxPlayWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
