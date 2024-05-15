import 'package:flutter/material.dart';

class AppbarHomeWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarHomeWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, kToolbarHeight, 0, 0),
      height: preferredSize.height,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome back!",
            style: textTheme.bodyMedium,
          ),
          Text(
            "What do you feel like today?",
            style: textTheme.displayMedium,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
