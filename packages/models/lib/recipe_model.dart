import 'package:models/ingredient_api_model.dart';

class Recipe {
  Recipe({
    required this.id,
    required this.image,
    required this.imageType,
    required this.likes,
    required this.missedIngredientCount,
    required this.missedIngredients,
    required this.title,
    required this.unusedIngredients,
    required this.usedIngredientCount,
    required this.usedIngredients,
  });
  late final int id;
  late final String image;
  late final String imageType;
  late final int likes;
  late final int missedIngredientCount;
  late final List<IngredientApiModel> missedIngredients;
  late final String title;
  late final List<IngredientApiModel> unusedIngredients;
  late final int usedIngredientCount;
  late final List<IngredientApiModel> usedIngredients;

  Recipe.empty();

  Recipe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    imageType = json['imageType'];
    likes = json['likes'];
    missedIngredientCount = json['missedIngredientCount'];
    missedIngredients = List.from(json['missedIngredients'])
        .map((e) => IngredientApiModel.fromJson(e))
        .toList();
    title = json['title'];
    unusedIngredients = List.from(json['unusedIngredients'])
        .map((e) => IngredientApiModel.fromJson(e))
        .toList();
    usedIngredientCount = json['usedIngredientCount'];
    usedIngredients = List.from(json['usedIngredients'])
        .map((e) => IngredientApiModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['imageType'] = imageType;
    data['likes'] = likes;
    data['missedIngredientCount'] = missedIngredientCount;
    data['missedIngredients'] =
        missedIngredients.map((e) => e.toJson()).toList();
    data['title'] = title;
    data['unusedIngredients'] =
        unusedIngredients.map((e) => e.toJson()).toList();
    data['usedIngredientCount'] = usedIngredientCount;
    data['usedIngredients'] = usedIngredients.map((e) => e.toJson()).toList();
    return data;
  }
}
