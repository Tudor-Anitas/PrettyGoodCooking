import 'package:flutter/material.dart';
import '../component_library.dart';

class HeightSpacer extends StatelessWidget {
  final Space size;
  const HeightSpacer({this.size = Space.small, super.key});

  @override
  Widget build(BuildContext context) {
    double spacing = 0;
    switch (size) {
      case Space.small:
        spacing = Spacing.small;
        break;
      case Space.medium:
        spacing = Spacing.xLarge;
        break;
      case Space.large:
        spacing = Spacing.xxxLarge;
        break;
    }
    return SizedBox(
      height: spacing,
    );
  }
}

enum Space { small, medium, large }
