import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/recipe_model.dart';
import 'package:recipe_search/recipe_search.dart';
import 'package:recipe_search/src/recipe_details/details_box.dart';
import 'package:recipe_search/src/recipe_details/ingredients_piechart.dart';

class RecipeDetails extends StatefulWidget {
  const RecipeDetails({super.key});

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  @override
  Widget build(BuildContext context) {
    Recipe recipe = context.watch<SearchRecipeCubit>().state.recipe;
    return Scaffold(
      body: BlocBuilder<SearchRecipeCubit, SearchRecipeState>(
        builder: (context, state) {
          return FutureBuilder(
            future: context
                .read<SearchRecipeCubit>()
                .getRecipeDetails(recipe.id.toString()),
            builder: (context, snapshot) {
              return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: state.statusBarHeight),
                  child: SizedBox(
                    child: Column(
                      children: [
                        Hero(
                          tag: recipe.id,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(RadiusSize.button),
                            child: Image.network(recipe.image),
                          ),
                        ),
                        const SizedBox(
                          height: Spacing.large,
                        ),
                        const DetailsBox()
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
