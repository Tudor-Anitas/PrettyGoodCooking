import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_page/home_page.dart';

class PanelRow extends StatefulWidget {
  final String ingredient;
  final Animation<double> animation;
  final int index;
  const PanelRow(
      {super.key,
      required this.ingredient,
      required this.animation,
      required this.index});

  @override
  State<PanelRow> createState() => _PanelRowState();
}

class _PanelRowState extends State<PanelRow> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return FadeTransition(
      opacity: widget.animation,
      child: SizedBox(
        height: Spacing.xMLarge,
        width: screenWidth,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            widget.ingredient,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          CustomIconButton(
              icon: Icons.remove,
              size: 24,
              color: AppColors.pink,
              onTap: () {
                // AnimatedList.of(context).removeItem(widget.index,
                //     (context, animation) {
                //   return PanelRow(
                //       ingredient: widget.ingredient,
                //       animation: animation,
                //       index: widget.index);
                // });
                context
                    .read<IngredientsMenuCubit>()
                    .removeItem(widget.ingredient, isMenuClosed: true);
              })
        ]),
      ),
    );
  }
}
