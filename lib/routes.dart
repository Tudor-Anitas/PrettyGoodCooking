import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_page/home_page.dart';
import 'package:recipe_search/recipe_search.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/search',
      pageBuilder: (context, state) => customTransition<void>(
        context: context,
        state: state,
        child: RecipeSearchPage(
          ingredients:
              state.extra is List<String> ? state.extra as List<String> : [],
        ),
      ),
      routes: [
        GoRoute(
          path: 'details',
          builder: (context, state) {
            return const RecipeDetailsPage();
          },
        ),
      ],
    ),
  ],
);

CustomTransitionPage customTransition<T>(
    {required BuildContext context,
    required GoRouterState state,
    required Widget child}) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween(begin: const Offset(-1.0, 0.0), end: Offset.zero);
      final curvedAnimation =
          CurvedAnimation(parent: animation, curve: Curves.easeInOutQuart);
      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}
