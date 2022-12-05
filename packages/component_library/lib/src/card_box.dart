import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class CardBox extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  const CardBox(
      {this.height = 0,
      this.width = 0,
      this.color = Colors.white,
      super.key,
      this.child,
      this.margin,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding ?? const EdgeInsets.all(Spacing.xLarge),
      margin: margin ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(RadiusSize.button),
          boxShadow: const [
            BoxShadow(
                offset: Offset(3, 3),
                blurRadius: 7.0,
                spreadRadius: 0.0,
                color: Colors.black38)
          ]),
      child: child,
    );
  }
}
