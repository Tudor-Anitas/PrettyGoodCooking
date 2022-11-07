import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'cubit/search_recipe_cubit.dart';

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
    //double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        margin: const EdgeInsets.symmetric(horizontal: Spacing.medium),
        child: FutureBuilder(
          future: context
              .read<SearchRecipeCubitCubit>()
              .searchRecipes(widget.ingredients),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Lottie.asset(
                      'packages/recipe_search/assets/animations/loading.json'));
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: ((context, index) =>
                      Text(snapshot.data!.elementAt(index).title)));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
