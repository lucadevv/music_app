import 'package:flutter/material.dart';
import 'package:music_app/shared/const/app_color.dart';

class ElippseWidget extends StatelessWidget {
  const ElippseWidget({
    super.key,
    required this.height,
    required this.width,
    required this.right,
    required this.left,
    required this.top,
    required this.bottom,
  });
  final double height;
  final double width;
  final double right;
  final double left;
  final double top;
  final double bottom;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      left: left,
      top: top,
      bottom: bottom,
      child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.purpleTown,
              blurRadius: 100,
            )
          ],
          shape: BoxShape.circle,
          color: AppColors.purpleTown,
        ),
      ),
    );
  }
}
