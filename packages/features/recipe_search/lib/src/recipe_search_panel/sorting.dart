import 'package:models/recipe_model.dart';

List<Recipe> sortByLeastMissingIngredients(List<Recipe> recipes) {
  recipes.sort(
    ((a, b) => a.missedIngredientCount.compareTo(b.missedIngredientCount)),
  );
  return recipes;
}
