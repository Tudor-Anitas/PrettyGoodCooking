import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final TextType type;
  final String text;
  final Color? color;
  final TextAlign alignment;
  const CustomText(this.text,
      {this.color,
      this.alignment = TextAlign.center,
      this.type = TextType.normal,
      super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle style;
    switch (type) {
      case TextType.title:
        style = Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: color, fontWeight: FontWeight.w700);
        break;
      case TextType.normal:
        style = Theme.of(context).textTheme.bodyText2!.copyWith(color: color);
        break;
      case TextType.button:
        style = Theme.of(context).textTheme.bodyText1!.copyWith(color: color);
        break;
    }
    return Text(
      text,
      style: style,
      textAlign: alignment,
    );
  }
}

enum TextType { title, normal, button }
