import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_page/src/keys.dart';
import 'package:models/menu_model.dart';
import 'package:monitoring/analytics_service.dart';

import 'menu_states.dart';

class IngredientsMenuCubit extends Cubit<IngredientsMenuState> {
  IngredientsMenuCubit()
      : super(const MenuClosed(
            MenuModel(category: FoodCategory.none, ingredients: [])));

  void openMenu() {
    AnalyticsService().logEvent(name: 'menu_open');
    debugPrint('opening Menu');
    emit(MenuOpen(state.menu));
  }

  void closeMenu() {
    AnalyticsService().logEvent(name: 'menu_closed');
    debugPrint('closing Menu');
    emit(MenuClosed(state.menu));
  }

  void openIngredientsCategory(
    FoodCategory category,
  ) {
    AnalyticsService().logEvent(name: 'menu_category_open');
    debugPrint('opening IngredientsCategory');
    MenuModel menu = state.menu.copyWith(category: category);
    emit(MenuCategoryOpen(menu));
  }

  void closeIngredientsCategory() {
    AnalyticsService().logEvent(name: 'menu_category_closed');
    debugPrint('closing IngredientsCategory');
    emit(MenuOpen(state.menu));
  }

  void addItem(String item) {
    if (!state.menu.ingredients!.contains(item)) {
      var items = List<String>.from(state.menu.ingredients!);
      items.add(item);
      listKey.currentState?.insertItem(items.length - 1);
      MenuModel menu = state.menu.copyWith(ingredients: items);
      debugPrint('item added to the list');

      emit(MenuCategoryOpen(menu));
    }
  }

  void removeItem(String item, {bool isMenuClosed = false}) {
    if (state.menu.ingredients!.contains(item)) {
      var items = List<String>.from(state.menu.ingredients!);
      int indexToRemove = items.indexOf(item);
      items.remove(item);
      listKey.currentState
          ?.removeItem(indexToRemove, (context, anim) => const SizedBox());
      debugPrint('item removed from list');
      MenuModel menu = state.menu.copyWith(ingredients: items);
      if (state is MenuClosed) {
        emit(MenuClosed(menu));
      } else {
        emit(MenuCategoryOpen(menu));
      }
    }
  }
}
