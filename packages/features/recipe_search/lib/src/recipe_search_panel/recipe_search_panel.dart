import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:recipe_search/src/recipe_search_panel/recipe_item.dart';
import 'package:recipe_search/src/recipe_search_panel/search_panel_header.dart';
import '../cubit/search_recipe_cubit.dart';

class RecipeSearchPage extends StatefulWidget {
  final List<String> ingredients;
  const RecipeSearchPage({super.key, required this.ingredients});

  @override
  State<RecipeSearchPage> createState() => _RecipeSearchPageState();
}

class _RecipeSearchPageState extends State<RecipeSearchPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: FutureBuilder(
          future: context
              .read<SearchRecipeCubitCubit>()
              .searchRecipes(widget.ingredients),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Lottie.asset(
                    'packages/recipe_search/assets/animations/loading.json'),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return CustomScrollView(
                slivers: [
                  const SearchPanelHeader(),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: snapshot.data?.length,
                      (context, index) {
                        var recipe = snapshot.data!.elementAt(index);
                        return RecipeItem(
                          name: recipe.title,
                          image: recipe.image,
                        );
                      },
                    ),
                  )
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
