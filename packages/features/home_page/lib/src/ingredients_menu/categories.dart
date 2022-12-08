import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_page/home_page.dart';

class IngredientsCategories extends StatefulWidget {
  const IngredientsCategories({super.key});

  @override
  State<StatefulWidget> createState() => _IngredientsCategoriesState();
}

class _IngredientsCategoriesState extends State<IngredientsCategories> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<IngredientsMenuCubit, IngredientsMenuState>(
      builder: (context, state) {
        double panelPositionY = state is MenuOpen || state is MenuCategoryOpen
            ? screenHeight * 0.2
            : screenHeight;

        double panelPositionX = state is MenuCategoryOpen ? -screenWidth : 0;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
          transform: Matrix4.translationValues(0, panelPositionY, 4),
          height: screenHeight * 0.8,
          width: screenWidth,
          padding: const EdgeInsets.all(Spacing.medium),
          decoration: BoxDecoration(
              color: Theme.of(context).bottomAppBarColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(RadiusSize.navbar),
                  topRight: Radius.circular(RadiusSize.navbar))),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 700),
                curve: Curves.fastLinearToSlowEaseIn,
                transform: Matrix4.translationValues(panelPositionX, 0, 0),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 700),
                  opacity: state is MenuCategoryOpen ? 0 : 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomIconButton(
                          icon: Icons.arrow_back_ios,
                          onTap: () {
                            context.read<IngredientsMenuCubit>().closeMenu();
                          }),
                      const SizedBox(
                        height: Spacing.xxLarge,
                      ),
                      SizedBox(
                        height: screenHeight * 0.5,
                        child: Column(
                          children: [
                            LongButton(
                                text: HomePageLocalizations.of(context)
                                    .vegetables,
                                textColor: AppColors.lightGreen,
                                onTap: () => context
                                    .read<IngredientsMenuCubit>()
                                    .openIngredientsCategory(
                                        FoodCategory.vegetables)),
                            LongButton(
                                text: HomePageLocalizations.of(context).fruits,
                                textColor: AppColors.brown,
                                onTap: () => context
                                    .read<IngredientsMenuCubit>()
                                    .openIngredientsCategory(
                                        FoodCategory.fruits)),
                            LongButton(
                                text: HomePageLocalizations.of(context).meat,
                                textColor: AppColors.pink,
                                onTap: () => context
                                    .read<IngredientsMenuCubit>()
                                    .openIngredientsCategory(
                                        FoodCategory.meat)),
                            LongButton(
                              text: HomePageLocalizations.of(context).other,
                              textColor: AppColors.darkBej,
                              onTap: () => context
                                  .read<IngredientsMenuCubit>()
                                  .openIngredientsCategory(FoodCategory.other),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: Spacing.medium,
                      ),
                      LongButton(
                        text: HomePageLocalizations.of(context).done,
                        onTap: () {
                          context.read<IngredientsMenuCubit>().closeMenu();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
