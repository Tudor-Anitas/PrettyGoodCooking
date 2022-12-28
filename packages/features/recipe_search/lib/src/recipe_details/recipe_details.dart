import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_search/recipe_search.dart';

class RecipeDetails extends StatefulWidget {
  final String recipeId;
  final String image;
  const RecipeDetails({super.key, required this.recipeId, required this.image});

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
          return Container(
            margin: EdgeInsets.only(top: state.statusBarHeight),
            padding: const EdgeInsets.symmetric(horizontal: Spacing.medium),
            child: SizedBox(
              width: screenWidth - 2 * Spacing.medium,
              child: Column(
                children: [
                  Hero(
                    tag: widget.recipeId,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(RadiusSize.button),
                      child: Image.network(widget.image),
                    ),
                  ),
                  // Text()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
