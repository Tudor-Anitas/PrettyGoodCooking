import 'package:api/api.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:models/recipe_details_model.dart';
import 'package:models/recipe_model.dart';

part 'search_recipe_state.dart';

class SearchRecipeCubit extends Cubit<SearchRecipeState> {
  SearchRecipeCubit()
      : super(SearchRecipeState(
            hasLoaded: false,
            statusBarHeight: 0,
            touchedIndex: -1,
            recipe: Recipe.empty()));

  /// Loading state shows if data has already been loaded,
  /// and bypasses later loadings from the api when returning
  /// from the details page of a recipe
  changeLoadingState(bool hasLoaded) {
    emit(state.copyWith(hasLoaded: hasLoaded));
  }

  setStatusBarHeight(double size) {
    emit(state.copyWith(statusBarHeight: size));
  }

  openRecipeDetailsPage(Recipe recipe) {
    emit(state.copyWith(touchedIndex: -1, recipe: recipe));
  }

  changeTouchedIndex(int newIndex) {
    emit(state.copyWith(touchedIndex: newIndex));
  }

  Future<List<Recipe>> searchRecipes(List<String> ingredients) async {
    var recipes = await RecipeApi().searchRecipes(ingredients);
    return recipes;
  }

  Future<RecipeDetails> getRecipeDetails(String recipeId) async {
    var details = await RecipeApi().getRecipeDetails(recipeId);
    return details;
  }
}
