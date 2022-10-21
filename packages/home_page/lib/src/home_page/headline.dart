import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:home_page/src/l10n/home_page_localizations.dart';

class Headline extends StatelessWidget {
  const Headline({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      HomePageLocalizations.of(context).header,
      type: TextType.title,
      alignment: TextAlign.end,
      color: Theme.of(context).primaryColor,
    );
  }
}
