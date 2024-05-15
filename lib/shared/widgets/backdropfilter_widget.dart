import 'dart:ui';

import 'package:flutter/material.dart';

class BackdropFilterWidget extends StatelessWidget {
  const BackdropFilterWidget({
    super.key,
    required this.sgx,
    required this.sgy,
  });
  final double sgx;
  final double sgy;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sgx, sigmaY: sgy),
      child: Container(
        color: Colors.transparent,
      ),
    );
  }
}
