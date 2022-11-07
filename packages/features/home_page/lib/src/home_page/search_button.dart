import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../home_page.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({super.key});

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  double opacity = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IngredientsMenuCubit, IngredientsMenuState>(
        builder: (context, state) {
      if (state is MenuClosed) {
        state.model.ingredients!.isEmpty ? opacity = 0 : opacity = 1;
      }
      return LongButton(
        onTap: () async {
          context.push('/search', extra: state.menu.ingredients);
        },
        text: HomePageLocalizations.of(context).search,
        color: AppColors.cactusGreen,
        textColor: AppColors.bej,
        opacity: opacity,
      );
    });
  }
}
