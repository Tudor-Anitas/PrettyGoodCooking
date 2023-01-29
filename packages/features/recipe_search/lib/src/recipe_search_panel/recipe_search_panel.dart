import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lottie/lottie.dart';
import 'package:models/recipe_model.dart';
import 'package:recipe_search/src/recipe_search_panel/recipe_item.dart';
import 'package:recipe_search/src/recipe_search_panel/search_panel_header.dart';
import 'package:recipe_search/src/recipe_search_panel/sorting.dart';
import '../cubit/search_recipe_cubit.dart';

class RecipeSearchPage extends StatefulWidget {
  final List<String> ingredients;
  const RecipeSearchPage({super.key, required this.ingredients});

  @override
  State<RecipeSearchPage> createState() => _RecipeSearchPageState();
}

class _RecipeSearchPageState extends State<RecipeSearchPage> {
  @override
  void initState() {
    context.read<SearchRecipeCubit>().changeLoadingState(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    context
        .read<SearchRecipeCubit>()
        .setStatusBarHeight(MediaQuery.of(context).viewPadding.top);
    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: BlocBuilder<SearchRecipeCubit, SearchRecipeState>(
          builder: (context, state) {
            return FutureBuilder(
              future: context
                  .read<SearchRecipeCubit>()
                  .searchRecipes(widget.ingredients),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting &&
                    !state.hasLoaded) {
                  return Center(
                    child: Lottie.asset(
                        'packages/recipe_search/assets/animations/loading.json'),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done ||
                    state.hasLoaded) {
                  if (!state.hasLoaded) {
                    context.read<SearchRecipeCubit>().changeLoadingState(true);
                  }
                  return CustomScrollView(
                    slivers: [
                      const SearchPanelHeader(),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: snapshot.data?.length,
                          (context, index) {
                            List<Recipe> recipes =
                                sortByLeastMissingIngredients(snapshot.data!);
                            var recipe = recipes.elementAt(index);
                            return RecipeItem(
                              recipe: recipe,
                            )
                                .animate()
                                .fade(
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    duration: 500.ms)
                                .slideY(begin: -1);
                          },
                        ),
                      )
                    ],
                  );
                }
                return const SizedBox();
              },
            );
          },
        ),
      ),
    );
  }
}
