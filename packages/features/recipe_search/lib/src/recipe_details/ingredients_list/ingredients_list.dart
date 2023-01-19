import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/ingredient_api_model.dart';
import 'package:models/recipe_model.dart';
import 'package:recipe_search/src/cubit/search_recipe_cubit.dart';
import 'package:recipe_search/src/recipe_details/ingredients_list/ingredient_headlines.dart';

class IngredientsList extends StatelessWidget {
  const IngredientsList({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryIngredient> ingredientNames = getIngredients(context);
    return IngredientHeadlines(
      ingredients: ingredientNames,
    );
  }
}

getIngredients(BuildContext context) {
  Recipe recipe = context.watch<SearchRecipeCubit>().state.recipe;

  List<CategoryIngredient> usedIngredients = List.generate(
      recipe.usedIngredientCount,
      (index) => CategoryIngredient(
          category: IngredientCategory.used,
          ingredient: recipe.usedIngredients.elementAt(index)));

  List<CategoryIngredient> missedIngredients = List.generate(
      recipe.missedIngredientCount,
      (index) => CategoryIngredient(
          category: IngredientCategory.missing,
          ingredient: recipe.missedIngredients.elementAt(index)));

  return usedIngredients + missedIngredients
    ..sort(
      ((a, b) => a.ingredient.name.compareTo(b.ingredient.name)),
    );
}

class CategoryIngredient {
  final IngredientApiModel ingredient;
  final IngredientCategory category;

  CategoryIngredient({required this.ingredient, required this.category});
}

enum IngredientCategory { used, missing, unused }
