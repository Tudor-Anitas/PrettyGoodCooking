import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_page/home_page.dart';

import '../bloc/menu_states.dart';

class IconRow extends StatelessWidget {
  const IconRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      BlocBuilder<IngredientsMenuCubit, IngredientsMenuState>(
        builder: (context, state) {
          return CustomIconButton(
            onTap: () => context.read<IngredientsMenuCubit>().openMenu(),
            icon: Icons.restaurant_menu,
            text: HomePageLocalizations.of(context).ingredientsButton,
          );
        },
      )
    ]);
  }
}
