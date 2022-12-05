import 'package:flutter/material.dart';
import 'package:recipe_search/recipe_search.dart';

class SearchPanelHeader extends StatelessWidget {
  const SearchPanelHeader({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SliverAppBar(
      expandedHeight: screenHeight * 0.15,
      backgroundColor: Theme.of(context).primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(RecipeSearchLocalizations.of(context).appBar),
      ),
    );
  }
}
