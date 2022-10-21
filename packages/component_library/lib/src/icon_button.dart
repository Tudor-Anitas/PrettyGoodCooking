import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final String text;
  final Function() onTap;
  const CustomIconButton(
      {super.key,
      required this.icon,
      this.color = Colors.black,
      this.text = '',
      required this.onTap});

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            size: 30,
            color: widget.color,
          ),
          if (widget.text.isNotEmpty) Text(widget.text)
        ],
      ),
    );
  }
}
