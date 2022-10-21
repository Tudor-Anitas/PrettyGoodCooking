import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:home_page/src/bloc/menu_states.dart';
import 'package:home_page/src/ingredients_menu/ingredient_row.dart';

class IngredientsTable extends StatefulWidget {
  final double height;
  final double width;
  final FoodCategory category;

  const IngredientsTable(
      {super.key,
      required this.height,
      required this.width,
      required this.category});

  @override
  State<IngredientsTable> createState() => _IngredientsTableState();
}

class _IngredientsTableState extends State<IngredientsTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusSize.button),
          color: Theme.of(context).backgroundColor),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('ingredients')
              .doc(widget.category.name)
              .snapshots(),
          builder: ((context, snapshot) {
            if (snapshot.data?.data() != null) {
              final data = snapshot.data?.data();
              return ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (context, index) => IngredientRow(
                        name: data?.values.elementAt(index),
                      ));
            }
            return Container();
          })),
    );
  }
}
