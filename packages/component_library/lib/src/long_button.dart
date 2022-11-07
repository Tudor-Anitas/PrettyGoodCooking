import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LongButton extends StatefulWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final Function() onTap;
  final Duration? duration;
  final Curve? curve;
  final double? opacity;
  const LongButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.color,
      this.textColor,
      this.duration,
      this.curve,
      this.opacity});

  @override
  State<LongButton> createState() => _LongButtonState();
}

class _LongButtonState extends State<LongButton>
    with SingleTickerProviderStateMixin {
  double margin = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (details) {
        setState(() {
          margin = Spacing.small;
        });
      },
      onTapUp: (details) {
        setState(() {
          margin = 0;
        });
      },
      child: AnimatedOpacity(
        opacity: widget.opacity ?? 1,
        duration: widget.duration ?? const Duration(milliseconds: 800),
        curve: widget.curve ?? Curves.fastLinearToSlowEaseIn,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastLinearToSlowEaseIn,
          constraints:
              const BoxConstraints(minHeight: 70, minWidth: 150, maxHeight: 70),
          decoration: BoxDecoration(
              color: widget.color ?? Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(RadiusSize.button)),
          margin: EdgeInsets.only(
              bottom: Spacing.medium, left: margin, right: margin),
          child: Center(
            child: Text(
              widget.text,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: widget.textColor ?? Colors.black,
                    fontFamily: GoogleFonts.passionOne().fontFamily,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
