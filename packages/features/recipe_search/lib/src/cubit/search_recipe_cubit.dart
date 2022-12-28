import 'package:api/api.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:models/recipe_model.dart';

part 'search_recipe_state.dart';

class SearchRecipeCubit extends Cubit<SearchRecipeState> {
  SearchRecipeCubit()
      : super(const SearchRecipeState(hasLoaded: false, statusBarHeight: 0));

  /// Loading state shows if data has already been loaded, 
  /// and bypasses later loadings from the api when returning 
  /// from the details page of a recipe
  changeLoadingState(bool hasLoaded) {
    emit(state.copyWith(hasLoaded: hasLoaded));
  }

  setStatusBarHeight(double size) {
    emit(state.copyWith(statusBarHeight: size));
  }

  Future<List<Recipe>> searchRecipes(List<String> ingredients) async {
    var recipes = await RecipeApi().searchRecipes(ingredients);
    return recipes;
  }
}
