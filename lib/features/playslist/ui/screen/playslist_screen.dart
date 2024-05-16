import 'package:flutter/material.dart';
import 'package:music_app/features/playslist/ui/widgets/sliverappbar_widged.dart';
import 'package:music_app/features/playslist/ui/widgets/sliverlist_widget.dart';
import 'package:music_app/shared/widgets/backdropfilter_widget.dart';
import 'package:music_app/shared/widgets/ellipse_widget.dart';

class PlaysListScreen extends StatelessWidget {
  static const name = "playslist_screen";
  const PlaysListScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const ElippseWidget(
              height: 10,
              width: 10,
              right: 0,
              left: 0,
              top: -300,
              bottom: 250,
            ),
            const ElippseWidget(
              height: 10,
              width: 10,
              right: 0,
              left: 0,
              top: 500,
              bottom: -500,
            ),
            const BackdropFilterWidget(
              sgx: 200,
              sgy: 200,
            ),
            SizedBox(
              height: size.height,
              width: size.width,
              child: const CustomScrollView(
                slivers: [
                  SliverAppbarWidget(),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 12),
                  ),
                  SliverListWidget()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
