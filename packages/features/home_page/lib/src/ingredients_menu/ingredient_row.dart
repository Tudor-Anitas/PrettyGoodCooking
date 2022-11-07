import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home_page.dart';

class IngredientRow extends StatefulWidget {
  final String name;
  const IngredientRow({super.key, required this.name});

  @override
  State<IngredientRow> createState() => _IngredientRowState();
}

class _IngredientRowState extends State<IngredientRow> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<IngredientsMenuCubit, IngredientsMenuState>(
      builder: (context, state) {
        bool isIngredientInList = isIngredientInState(state);
        return Container(
          height: Spacing.xxLarge,
          width: screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: Spacing.xxLarge),
          child: Row(children: [
            Checkbox(
              value: isIngredientInList,
              onChanged: (value) {
                if (value!) {
                  context.read<IngredientsMenuCubit>().addItem(widget.name);
                } else {
                  context.read<IngredientsMenuCubit>().removeItem(widget.name);
                }
              },
              activeColor: AppColors.cactusGreen,
            ),
            Text(widget.name)
          ]),
        );
      },
    );
  }

  bool isIngredientInState(IngredientsMenuState state) {
    if (state is MenuCategoryOpen) {
      return state.menu.ingredients!.contains(widget.name);
    }
    return false;
  }
}
