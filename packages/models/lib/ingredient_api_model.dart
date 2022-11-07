class IngredientApiModel {
  IngredientApiModel({
    required this.aisle,
    required this.amount,
    required this.id,
    required this.image,
    required this.meta,
    required this.name,
    required this.original,
    required this.originalName,
    required this.unit,
    required this.unitLong,
    required this.unitShort,
  });
  late final String aisle;
  late final double amount;
  late final int id;
  late final String image;
  late final List<dynamic> meta;
  late final String name;
  late final String original;
  late final String originalName;
  late final String unit;
  late final String unitLong;
  late final String unitShort;
  
  IngredientApiModel.fromJson(Map<String, dynamic> json){
    aisle = json['aisle'];
    amount = json['amount'];
    id = json['id'];
    image = json['image'];
    meta = List.castFrom<dynamic, dynamic>(json['meta']);
    name = json['name'];
    original = json['original'];
    originalName = json['originalName'];
    unit = json['unit'];
    unitLong = json['unitLong'];
    unitShort = json['unitShort'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['aisle'] = aisle;
    data['amount'] = amount;
    data['id'] = id;
    data['image'] = image;
    data['meta'] = meta;
    data['name'] = name;
    data['original'] = original;
    data['originalName'] = originalName;
    data['unit'] = unit;
    data['unitLong'] = unitLong;
    data['unitShort'] = unitShort;
    return data;
  }
}