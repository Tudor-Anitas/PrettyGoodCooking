import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:models/recipe_model.dart';

import '../../recipe_search.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;
  const RecipeItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        context.read<SearchRecipeCubit>().openRecipeDetailsPage(recipe);
        context.push('/search/details');
      },
      child: CardBox(
        height: screenHeight * 0.15,
        width: screenWidth,
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.symmetric(
            vertical: Spacing.medium, horizontal: Spacing.medium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
              tag: recipe.id,
              child: CardBox(
                height: screenHeight * 0.125,
                width: screenHeight * 0.125,
                padding: EdgeInsets.zero,
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  children: [
                    Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(RadiusSize.button),
                      child: Image.network(recipe.image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              SvgPicture.asset(
                                  'packages/recipe_search/assets/img/food_loading.svg')),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.125,
              width: screenWidth * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.125 * 0.75,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            recipe.title,
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.125 * 0.25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedTag(
                          tag: IngredientTag.used,
                          number: recipe.usedIngredientCount,
                        ),
                        const SizedBox(
                          width: Spacing.medium,
                        ),
                        RoundedTag(
                            tag: IngredientTag.missing,
                            number: recipe.missedIngredientCount)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
