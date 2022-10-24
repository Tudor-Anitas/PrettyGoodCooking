library home_page;

import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:home_page/src/home_page/panel/panel.dart';
import 'package:home_page/src/ingredients_menu/categories.dart';
import 'package:home_page/src/ingredients_menu/menu.dart';

import 'headline.dart';
import 'nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Scaffold(
            body: Container(
              height: screenHeight,
              margin: const EdgeInsets.symmetric(horizontal: Spacing.medium),
              padding: const EdgeInsets.only(top: Spacing.xLarge),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                const HeightSpacer(
                  size: Space.medium,
                ),
                const Headline(),
                const HeightSpacer(
                  size: Space.medium,
                ),
                HomeScreenPanel(height: screenHeight * 0.5, width: screenWidth)
              ]),
            ),
          ),
          const IngredientsCategories(),
          const IngredientsMenu(),
          NavBar(
            height: screenHeight * 0.1,
            width: screenWidth,
          ),
        ],
      ),
    );
  }
}
