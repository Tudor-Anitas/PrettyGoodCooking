import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:home_page/home_page.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => BlocProvider(
      create: (context) => IngredientsMenuCubit(),
      child: const HomePage(),
    ),
  )
]);
