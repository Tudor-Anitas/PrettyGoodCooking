import 'home_page_localizations.dart';

/// The translations for English (`en`).
class HomePageLocalizationsEn extends HomePageLocalizations {
  HomePageLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get header => 'Choose your ingredients';

  @override
  String get ingredientsButton => 'Ingredients';

  @override
  String get fruits => 'FRUITS';

  @override
  String get meat => 'MEAT';

  @override
  String get vegetables => 'VEGETABLES';

  @override
  String get other => 'OTHER';

  @override
  String get done => 'DONE';

  @override
  String get search => 'Search recipe!';
}
