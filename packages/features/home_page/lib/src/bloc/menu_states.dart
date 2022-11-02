import 'package:equatable/equatable.dart';
import 'package:models/menu_model.dart';

abstract class IngredientsMenuState extends Equatable {
  final MenuModel menu;
  const IngredientsMenuState(this.menu);
}

class MenuClosed extends IngredientsMenuState {
  final MenuModel model;
  const MenuClosed(this.model) : super(model);

  @override
  List<Object?> get props => [model];
}

class MenuOpen extends IngredientsMenuState {
  final MenuModel model;
  const MenuOpen(this.model) : super(model);

  @override
  List<Object?> get props => [model];
}

class MenuCategoryOpen extends IngredientsMenuState {
  final MenuModel model;
  const MenuCategoryOpen(this.model) : super(model);

  @override
  List<Object?> get props => [menu];
}

enum FoodCategory { vegetables, fruits, meat, other, none }
