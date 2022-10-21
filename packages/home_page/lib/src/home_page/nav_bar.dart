import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_page/home_page.dart';
import 'package:home_page/src/home_page/icon_row.dart';

import '../bloc/menu_states.dart';

class NavBar extends StatefulWidget {
  final double? height;
  final double? width;
  const NavBar({this.height = 0, this.width = 0, super.key});

  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: BlocBuilder<IngredientsMenuCubit, IngredientsMenuState>(
        builder: (context, state) {
          return Visibility(
            visible: state is MenuClosed,
            child: Container(
              height: widget.height,
              width: widget.width,
              decoration: BoxDecoration(
                  color: Theme.of(context).bottomAppBarColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(RadiusSize.navbar),
                      topRight: Radius.circular(RadiusSize.navbar))),
              child: const IconRow(),
            ),
          );
        },
      ),
    );
  }
}
