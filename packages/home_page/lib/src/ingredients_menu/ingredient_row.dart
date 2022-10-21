import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

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
    return Container(
      height: Spacing.xxLarge,
      width: screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: Spacing.xxLarge),
      margin: const EdgeInsets.only(bottom: Spacing.medium),
      child: Row(children: [
        Checkbox(value: true, onChanged: (value) {}),
        Text(widget.name)
      ]),
    );
  }
}
