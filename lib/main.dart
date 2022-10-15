import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pretty_good_cooking/firebase_options.dart';
import 'package:component_library/component_library.dart';
import 'package:pretty_good_cooking/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme().currentTheme,
      routerConfig: router,
    );
  }
}
