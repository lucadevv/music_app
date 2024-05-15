import 'package:flutter/material.dart';
import 'package:music_app/shared/widgets/item_music_widget.dart';

class SliverListWidget extends StatelessWidget {
  const SliverListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 12, right: 16, left: 16),
          child: ItemMusicWidget(),
        );
      },
    );
  }
}
