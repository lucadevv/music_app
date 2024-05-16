import 'package:flutter/material.dart';

class YourFavoriteWidget extends StatelessWidget {
  const YourFavoriteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Your favorites",
            style: textTheme.displayLarge!.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  //child: ItemMusicWidget(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
