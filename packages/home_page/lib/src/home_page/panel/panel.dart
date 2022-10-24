import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_page/home_page.dart';
import 'package:home_page/src/home_page/panel/panel_row.dart';

import '../../bloc/menu_states.dart';

class HomeScreenPanel extends StatefulWidget {
  final double height;
  final double width;
  const HomeScreenPanel({super.key, required this.height, required this.width});

  @override
  State<HomeScreenPanel> createState() => _HomeScreenPanelState();
}

class _HomeScreenPanelState extends State<HomeScreenPanel> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IngredientsMenuCubit, IngredientsMenuState>(
      builder: (context, state) {
        int itemLength = state is MenuClosed ? state.menu.ingredients!.length : 0;
        return CardBox(
          height: widget.height,
          width: widget.width,
          child: ListView.builder(
              itemCount: itemLength,
              itemBuilder: ((context, index) {
                if (state is MenuClosed) {
                  return PanelRow(
                      ingredient: state.menu.ingredients!.elementAt(index));
                }
                return const SizedBox();
              })),
        );
      },
    );
  }
}
