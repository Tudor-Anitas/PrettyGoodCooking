import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_page/src/ingredients_menu/table.dart';

import '../../home_page.dart';
import '../bloc/menu_states.dart';

class IngredientsMenu extends StatefulWidget {
  const IngredientsMenu({super.key});

  @override
  State<StatefulWidget> createState() => _IngredientsMenuState();
}

class _IngredientsMenuState extends State<IngredientsMenu> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<IngredientsMenuCubit, IngredientsMenuState>(
      builder: (context, state) {
        double panelPosition = state is MenuCategoryOpen ? 0 : screenWidth;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          curve: Curves.fastLinearToSlowEaseIn,
          transform: Matrix4.translationValues(
              panelPosition, screenHeight * 0.2 + Spacing.medium, 1),
          child: Container(
            height: screenHeight * 0.8,
            width: screenWidth,
            padding: const EdgeInsets.symmetric(horizontal: Spacing.medium),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomIconButton(
                  icon: Icons.arrow_back_ios,
                  onTap: () {
                    context
                        .read<IngredientsMenuCubit>()
                        .closeIngredientsCategory();
                  }),
              const SizedBox(
                height: Spacing.xxLarge,
              ),
              IngredientsTable(
                  height: screenHeight * 0.5,
                  width: screenWidth,
                  category: state is MenuCategoryOpen
                      ? state.menu.category!
                      : FoodCategory.none),
              const SizedBox(
                height: Spacing.medium,
              ),
              LongButton(
                  text: HomePageLocalizations.of(context).done,
                  onTap: () {
                    context
                        .read<IngredientsMenuCubit>()
                        .closeIngredientsCategory();
                  })
            ]),
          ),
        );
      },
    );
  }
}
