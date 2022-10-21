import 'package:equatable/equatable.dart';

abstract class IngredientsMenuState extends Equatable {
  const IngredientsMenuState();
}

class MenuClosed extends IngredientsMenuState {
  const MenuClosed();

  @override
  List<Object?> get props => [];
}

class MenuOpen extends IngredientsMenuState {
  const MenuOpen();

  @override
  List<Object?> get props => [];
}

class MenuCategoryOpen extends IngredientsMenuState {
  final FoodCategory category;
  final List<String> items;
  const MenuCategoryOpen(this.category, {this.items = const []});

  @override
  List<Object?> get props => [category, items];
}

enum FoodCategory { vegetables, fruits, meat, other, none }
