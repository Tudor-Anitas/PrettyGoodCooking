import 'package:component_library/component_library.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_search/recipe_search.dart';
import 'package:recipe_search/src/recipe_details/category_box.dart';

class IngredientsPieChart extends StatefulWidget {
  const IngredientsPieChart({super.key});

  @override
  State<IngredientsPieChart> createState() => _IngredientsPieChartState();
}

class _IngredientsPieChartState extends State<IngredientsPieChart> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    int touchedIndex = context.watch<SearchRecipeCubit>().state.touchedIndex;
    List<PieChartSectionData> pieChartSections() {
      return List.generate(
        3,
        ((index) {
          final isTouched = index == touchedIndex;

          double radius = isTouched ? 30 : 25;
          switch (index) {
            case 0:
              return PieChartSectionData(
                value: 25,
                color: AppColors.cactusGreen,
                showTitle: false,
                radius: radius,
              );
            case 1:
              return PieChartSectionData(
                  value: 45,
                  color: AppColors.pink,
                  showTitle: false,
                  radius: radius);

            case 2:
              return PieChartSectionData(
                  value: 30,
                  color: Colors.deepPurpleAccent,
                  showTitle: false,
                  radius: radius);
            default:
              throw Error();
          }
        }),
      );
    }

    return SizedBox(
      height: screenHeight * 0.5,
      width: screenWidth,
      child: Column(
        children: [
          Expanded(
            child: PieChart(
              PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (event, response) {
                      if (!event.isInterestedForInteractions ||
                          response == null ||
                          response.touchedSection == null) {
                        return;
                      }

                      context.read<SearchRecipeCubit>().changeTouchedIndex(
                          response.touchedSection!.touchedSectionIndex);
                    },
                  ),
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 10,
                  centerSpaceRadius: screenWidth * 0.2,
                  sections: pieChartSections()),
            ),
          ),
          const SizedBox(
            height: Spacing.large,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CategoryBox(
                  text: 'ingredients',
                  color: AppColors.cactusGreen,
                  isTouched: touchedIndex == 0,
                ),
                CategoryBox(
                  text: 'missing ingredients',
                  color: AppColors.pink,
                  isTouched: touchedIndex == 1,
                ),
                CategoryBox(
                  text: 'unused ingredients',
                  color: Colors.deepPurpleAccent,
                  isTouched: touchedIndex == 2,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
