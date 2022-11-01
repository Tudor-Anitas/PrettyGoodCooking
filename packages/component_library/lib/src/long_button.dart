import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LongButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final Function() onTap;
  const LongButton(
      {super.key,
      required this.text,
      this.color,
      required this.onTap,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(
            minHeight: 70, minWidth: 150, maxHeight: 70),
        decoration: BoxDecoration(
            color: color ?? Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(RadiusSize.button)),
        margin: const EdgeInsets.only(bottom: Spacing.medium),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: textColor ?? Colors.black,
                  fontFamily: GoogleFonts.passionOne().fontFamily,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
