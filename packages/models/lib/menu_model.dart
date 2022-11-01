import 'package:equatable/equatable.dart';
import 'package:home_page/home_page.dart';

class MenuModel extends Equatable {
  final List<String>? ingredients;
  final FoodCategory? category;

  const MenuModel({this.ingredients, this.category});

  MenuModel copyWith({List<String>? ingredients, FoodCategory? category}) {
    return MenuModel(
        ingredients: ingredients ?? this.ingredients,
        category: category ?? this.category);
  }

  @override
  List<Object?> get props => [ingredients, category];
}
