library home_page;

import 'package:flutter/material.dart';
import 'package:home_page/src/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: const [Positioned(bottom: 0, child: NavBar())],
      )),
    );
  }
}
