import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:models/recipe_model.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;
  const RecipeItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () =>
          context.push('/search/details', extra: [recipe]),
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
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(RadiusSize.button),
                    child: Image.network(
                      recipe.image,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        );
                        //return Container(color: Colors.blue,);
                      },
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.125,
              width: screenWidth * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: Text(
                        recipe.title,
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.center,
                      )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
