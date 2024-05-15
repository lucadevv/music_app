import 'dart:ui';

import 'package:flutter/material.dart';

class BackdropFilterWidget extends StatelessWidget {
  const BackdropFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 200.0, sigmaY: 200.0),
      child: Container(
        color: Colors.transparent,
      ),
    );
  }
}
