
class RecipeDetails {
    String? name;
    List<Steps>? steps;

    RecipeDetails({this.name, this.steps});

    RecipeDetails.fromJson(Map<String, dynamic> json) {
        name = json["name"];
        steps = json["steps"] == null ? null : (json["steps"] as List).map((e) => Steps.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["name"] = name;
        if(steps != null) {
            data["steps"] = steps?.map((e) => e.toJson()).toList();
        }
        return data;
    }
}

class Steps {
    List<Equipment>? equipment;
    List<Ingredients>? ingredients;
    int? number;
    String? step;

    Steps({this.equipment, this.ingredients, this.number, this.step});

    Steps.fromJson(Map<String, dynamic> json) {
        equipment = json["equipment"] == null ? null : (json["equipment"] as List).map((e) => Equipment.fromJson(e)).toList();
        ingredients = json["ingredients"] == null ? null : (json["ingredients"] as List).map((e) => Ingredients.fromJson(e)).toList();
        number = json["number"];
        step = json["step"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        if(equipment != null) {
            data["equipment"] = equipment?.map((e) => e.toJson()).toList();
        }
        if(ingredients != null) {
            data["ingredients"] = ingredients?.map((e) => e.toJson()).toList();
        }
        data["number"] = number;
        data["step"] = step;
        return data;
    }
}

class Ingredients {
    int? id;
    String? image;
    String? name;

    Ingredients({this.id, this.image, this.name});

    Ingredients.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        image = json["image"];
        name = json["name"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["id"] = id;
        data["image"] = image;
        data["name"] = name;
        return data;
    }
}

class Equipment {
    int? id;
    String? image;
    String? name;

    Equipment({this.id, this.image, this.name});

    Equipment.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        image = json["image"];
        name = json["name"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["id"] = id;
        data["image"] = image;
        data["name"] = name;
        return data;
    }
}