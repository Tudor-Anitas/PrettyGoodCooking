library api;

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:models/recipe_details_model.dart';
import 'package:models/recipe_model.dart';
import 'package:monitoring/analytics_service.dart';

class RecipeApi {
  final String _apiKey = const String.fromEnvironment('app-key');
  static const String base = 'https://api.spoonacular.com';

  Future<List<Recipe>> searchRecipes(List<String> ingredients) async {
    List<Recipe> recipes = [];
    String formatedIngredients = ingredients.join(',');
    try {
      http.Response response = await http.get(Uri.parse(
          '$base/recipes/findByIngredients?ingredients=$formatedIngredients&apiKey=$_apiKey'));

      if (response.statusCode == 200) {
        List jsonResult = json.decode(response.body);
        for (var entry in jsonResult) {
          recipes.add(Recipe.fromJson(entry));
        }
      } else {
        AnalyticsService().logEvent(
            name: 'api_search_recipe_status_code',
            parameters: {'statusCode': response.statusCode});
      }
    } catch (e) {
      // AnalyticsService()
      //     .logEvent(name: 'api_search_recipe_error', parameters: {'stack': e});
    }
    return recipes;
  }

  Future<RecipeDetails> getRecipeDetails(String recipeId) async {
    try {
      http.Response response = await http.get(Uri.parse(
          '$base/recipes/$recipeId/analyzedInstructions?apiKey=$_apiKey'));
      if (response.statusCode == 200) {
        var jsonBody = json.decode(response.body);
        return RecipeDetails.fromJson(jsonBody[0]);
      } else {
        AnalyticsService().logEvent(
            name: 'api_recipe_details_status_code',
            parameters: {'status_code': response.statusCode});
      }
    } catch (e) {
      // AnalyticsService()
      //     .logEvent(name: 'api_recipe_details_error', parameters: {'stack': e});

    }
    return RecipeDetails.fromJson({});
  }
}
