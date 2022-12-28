import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_page/home_page.dart';
import 'package:recipe_search/recipe_search.dart';
import 'package:pretty_good_cooking/firebase_options.dart';
import 'package:component_library/component_library.dart';
import 'package:pretty_good_cooking/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => IngredientsMenuCubit(),
          ),
          BlocProvider(
            create: ((context) => SearchRecipeCubit()),
          ),
        ],
        child: MaterialApp.router(
          theme: AppTheme().currentTheme,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            HomePageLocalizations.delegate,
            RecipeSearchLocalizations.delegate
          ],
          supportedLocales: const [Locale('en', '')],
          routerConfig: router,
        ));
  }
}
