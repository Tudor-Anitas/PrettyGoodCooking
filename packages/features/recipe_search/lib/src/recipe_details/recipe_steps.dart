import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:models/recipe_details_model.dart';

class RecipeSteps extends StatelessWidget {
  final RecipeDetails details;
  const RecipeSteps({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomText(
          'Steps',
          type: TextType.title,
        ),
        const SizedBox(
          height: Spacing.medium,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: getSteps(details),
        ),
      ],
    );
  }
}

getSteps(RecipeDetails details) {
  if (details.steps != null) {
    return List.generate(
      details.steps!.length,
      (index) => CustomText(
        '${index + 1}. ${details.steps!.elementAt(index).step!}\n',
        alignment: TextAlign.start,
      ),
    );
  }
}
