import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/recipe_model.dart';
import 'package:recipe_search/src/cubit/search_recipe_cubit.dart';

import 'ingredients_piechart.dart';

class DetailsBox extends StatefulWidget {
  const DetailsBox({super.key});

  @override
  State<DetailsBox> createState() => _DetailsBoxState();
}

class _DetailsBoxState extends State<DetailsBox> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Recipe recipe = context.read<SearchRecipeCubit>().state.recipe;
    return CardBox(
      height: screenHeight * 0.8,
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
            unusedIngredientsCount: recipe.unusedIngredients.length,
          ),
          
        ],
      ),
    );
  }
}
