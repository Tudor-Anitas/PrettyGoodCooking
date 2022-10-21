import 'package:flutter_bloc/flutter_bloc.dart';

import 'menu_states.dart';

class IngredientsMenuCubit extends Cubit<IngredientsMenuState> {
  IngredientsMenuCubit() : super(const MenuClosed());

  void openMenu() {
    emit(const MenuOpen());
  }

  void closeMenu() {
    emit(const MenuClosed());
  }

  void openIngredientsCategory(FoodCategory category) {
    emit(MenuCategoryOpen(category));
  }

  void closeIngredientsCategory() {
    emit(const MenuOpen());
  }
}
