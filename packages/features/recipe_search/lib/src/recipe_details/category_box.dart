import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  final String text;
  final Color color;
  final bool isTouched;
  const CategoryBox(
      {super.key,
      required this.text,
      required this.color,
      this.isTouched = false});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHeight * 0.04,
      width: screenWidth * 0.5,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: screenWidth * 0.5 * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: isTouched ? 20 : 15,
                  width: isTouched ? 20 : 15,
                  margin: const EdgeInsets.only(right: Spacing.small),
                  color: color,
                ),
              ],
            ),
          ),
          isTouched
              ? Text(
                  text,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              : Text(text)
        ],
      ),
    );
  }
}
