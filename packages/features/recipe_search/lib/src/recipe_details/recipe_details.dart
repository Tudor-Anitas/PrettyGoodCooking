import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/recipe_model.dart';
import 'package:recipe_search/recipe_search.dart';
import 'package:recipe_search/src/recipe_details/ingredients_piechart.dart';

class RecipeDetails extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetails({super.key, required this.recipe});

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<SearchRecipeCubit, SearchRecipeState>(
        builder: (context, state) {
          return FutureBuilder(
            future: context
                .read<SearchRecipeCubit>()
                .getRecipeDetails(widget.recipe.id.toString()),
            builder: (context, snapshot) {
              return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: state.statusBarHeight),
                  // padding:
                  //     const EdgeInsets.symmetric(horizontal: Spacing.medium),
                  child: SizedBox(
                    //width: screenWidth - 2 * Spacing.medium,
                    child: Column(
                      children: [
                        Hero(
                          tag: widget.recipe.id,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(RadiusSize.button),
                            child: Image.network(widget.recipe.image),
                          ),
                        ),
                        const SizedBox(
                          height: Spacing.large,
                        ),
                        CardBox(
                          height: screenHeight * 0.8,
                          width: screenWidth,
                          child: Column(children: [
                            CustomText(
                              widget.recipe.title,
                              type: TextType.title,
                            ),
                            const SizedBox(
                              height: Spacing.large,
                            ),
                            const IngredientsPieChart(),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
