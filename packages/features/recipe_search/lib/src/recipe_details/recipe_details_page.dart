import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/recipe_model.dart';
import 'package:recipe_search/recipe_search.dart';
import 'package:recipe_search/src/recipe_details/details_area.dart';

class RecipeDetailsPage extends StatefulWidget {
  const RecipeDetailsPage({super.key});

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        if (snapshot.data != null)
                          DetailsArea(
                            details: snapshot.data!,
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
