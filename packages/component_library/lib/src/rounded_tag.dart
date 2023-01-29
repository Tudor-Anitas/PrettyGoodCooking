import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class RoundedTag extends StatelessWidget {
  final IngredientTag tag;
  final int number;
  const RoundedTag({super.key, required this.tag, required this.number});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Color primary =
        tag == IngredientTag.used ? AppColors.lightGreen : AppColors.pink;
    Color background = tag == IngredientTag.used
        ? AppColors.difuseLightGreen
        : AppColors.difusePink;
    String text =
        tag == IngredientTag.used ? 'unsed: $number' : 'missing: $number';

    return Container(
      height: Spacing.large,
      padding: const EdgeInsets.symmetric(horizontal: Spacing.xSmall),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusSize.button),
          border: Border.all(color: primary),
          color: background),
      child: Center(
        child: Text(
          text,
          //style: Theme.of(context).textTheme.bodyText1!.copyWith(color: primary),
        ),
      ),
    );
  }
}

enum IngredientTag { used, missing }
