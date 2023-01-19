import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/recipe_model.dart';
import 'package:recipe_search/src/cubit/search_recipe_cubit.dart';
import 'package:recipe_search/src/recipe_details/ingredients_list/ingredients_list.dart';

import 'ingredients_piechart.dart';

class DetailsArea extends StatefulWidget {
  const DetailsArea({super.key});

  @override
  State<DetailsArea> createState() => _DetailsAreaState();
}

class _DetailsAreaState extends State<DetailsArea> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Recipe recipe = context.read<SearchRecipeCubit>().state.recipe;
    return CardBox(
      height: calculateTotalHeight(recipe, screenHeight),
      width: screenWidth,
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
          const IngredientsList()
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
  double heightIngredientNames = screenHeight * nrOfIngredients * 0.03;

  return heightChartAndTitle + heightIngredientNames;
}
