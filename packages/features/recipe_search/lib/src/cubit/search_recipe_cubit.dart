import 'package:api/api.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:models/recipe_model.dart';

part 'search_recipe_cubit_state.dart';

class SearchRecipeCubitCubit extends Cubit<SearchRecipeCubitState> {
  SearchRecipeCubitCubit() : super(SearchRecipeCubitInitial());

  Future<List<Recipe>> searchRecipes(List<String> ingredients) async {
    var recipes = await RecipeApi().searchRecipes(ingredients);
    return recipes;
  }
}
