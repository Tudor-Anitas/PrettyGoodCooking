import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_search/src/cubit/search_recipe_cubit.dart';
import 'package:recipe_search/src/recipe_details/ingredients_list/ingredients_list.dart';

class IngredientHeadlines extends StatefulWidget {
  final List<CategoryIngredient> ingredients;
  const IngredientHeadlines({super.key, required this.ingredients});

  @override
  State<IngredientHeadlines> createState() => _IngredientHeadlinesState();
}

class _IngredientHeadlinesState extends State<IngredientHeadlines> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: buildIngredientHeadlines(context, widget.ingredients));
  }
}

buildIngredientHeadlines(
    BuildContext context, List<CategoryIngredient> ingredients) {
  var state = context.watch<SearchRecipeCubit>().state;

  return List.generate(
    ingredients.length,
    (index) {
      Color textColor = Colors.black;
      TextType textType = TextType.headline;
      if (indexesAreEqual(
          state.touchedIndex, ingredients.elementAt(index).category)) {
        textColor = state.touchedIndex == 0
            ? AppColors.cactusGreen
            : state.touchedIndex == 1
                ? AppColors.pink
                : state.touchedIndex == 2
                    ? Colors.deepPurpleAccent
                    : Colors.black;

        textType = TextType.headlineW600;
      }

      return CustomText(
        '\u2022 ${formatAmount(ingredients.elementAt(index).ingredient.amount)} ${ingredients.elementAt(index).ingredient.unit} ${ingredients.elementAt(index).ingredient.name}',
        color: textColor,
        type: textType,
        alignment: TextAlign.start,
      );
    },
  );
}

bool indexesAreEqual(int index, IngredientCategory category) {
  if (index == 0 && category == IngredientCategory.used ||
      index == 1 && category == IngredientCategory.missing ||
      index == 2 && category == IngredientCategory.unused) {
    return true;
  }
  return false;
}

String formatAmount(double amount) {
  return amount.toStringAsFixed(amount.truncateToDouble() == amount ? 0 : 2);
}
