import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/recipe_details_model.dart';
import 'package:models/recipe_model.dart';
import 'package:recipe_search/recipe_search.dart';
import 'package:recipe_search/src/cubit/search_recipe_cubit.dart';
import 'package:recipe_search/src/recipe_details/ingredients_list/ingredients_list.dart';
import 'package:recipe_search/src/recipe_details/recipe_steps.dart';

import 'ingredients_piechart.dart';

class DetailsArea extends StatefulWidget {
  final RecipeDetails details;
  const DetailsArea({super.key, required this.details});

  @override
  State<DetailsArea> createState() => _DetailsAreaState();
}

class _DetailsAreaState extends State<DetailsArea> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    Recipe recipe = context.read<SearchRecipeCubit>().state.recipe;
    return CardBox(
      width: screenWidth - 2 * Spacing.medium,
      margin: const EdgeInsets.symmetric(horizontal: Spacing.medium),
      child: Column(
        children: [
          CustomText(
            recipe.title,
            type: TextType.title,
          ),
          const SizedBox(
            height: Spacing.large,
          ),
          IngredientsPieChart(
            ingredientsCount: recipe.usedIngredientCount,
            missingIngredientsCount: recipe.missedIngredientCount,
          ),
          const SizedBox(
            height: Spacing.medium,
          ),
          const IngredientsList(),
          const SizedBox(
            height: Spacing.xLarge,
          ),
          RecipeSteps(details: widget.details)
        ],
      ),
    );
  }
}

calculateTotalHeight(Recipe recipe, double screenHeight) {
  double heightChartAndTitle = screenHeight * 0.7;
  int nrOfIngredients = recipe.usedIngredientCount +
      recipe.missedIngredientCount +
      recipe.unusedIngredients.length;
  double heightIngredientNames = screenHeight * nrOfIngredients * 0.5;

  return heightChartAndTitle + heightIngredientNames;
}
