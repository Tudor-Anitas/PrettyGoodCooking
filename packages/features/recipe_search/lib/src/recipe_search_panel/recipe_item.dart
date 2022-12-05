import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class RecipeItem extends StatelessWidget {
  final String name;
  final String image;
  const RecipeItem({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return CardBox(
      height: screenHeight * 0.15,
      width: screenWidth,
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.symmetric(
          vertical: Spacing.medium, horizontal: Spacing.medium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CardBox(
            height: screenHeight * 0.125,
            width: screenHeight * 0.125,
            padding: EdgeInsets.zero,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(RadiusSize.button),
              child: Image.network(
                image,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null),
                  );
                },
                fit: BoxFit.cover,
              ),
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
                      name,
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
    );
  }
}
