import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_page/home_page.dart';

class PanelRow extends StatefulWidget {
  final String ingredient;
  const PanelRow({super.key, required this.ingredient});

  @override
  State<PanelRow> createState() => _PanelRowState();
}

class _PanelRowState extends State<PanelRow> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: Spacing.xLarge,
      width: screenWidth,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          widget.ingredient,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        CustomIconButton(
            icon: Icons.remove,
            size: 24,
            color: AppColors.pink,
            onTap: () {
              context
                  .read<IngredientsMenuCubit>()
                  .removeItem(widget.ingredient, isMenuClosed: true);
            })
      ]),
    );
  }
}
