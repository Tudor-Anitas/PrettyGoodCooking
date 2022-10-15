import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.1,
      width: screenWidth,
      decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarColor,
          //border: const Border(top: BorderSide(color: Colors.grey)),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(RadiusSize.navbar),
              topRight: Radius.circular(RadiusSize.navbar))),
    );
  }
}
