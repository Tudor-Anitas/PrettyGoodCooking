part of 'search_recipe_cubit.dart';

class SearchRecipeState extends Equatable {
  final bool hasLoaded;
  final double statusBarHeight;
  final int touchedIndex;
  final Recipe recipe;
  const SearchRecipeState(
      {required this.hasLoaded,
      required this.statusBarHeight,
      required this.touchedIndex,
      required this.recipe});

  @override
  List<Object> get props => [hasLoaded, statusBarHeight, touchedIndex, recipe];

  SearchRecipeState copyWith(
      {bool? hasLoaded,
      double? statusBarHeight,
      int? touchedIndex,
      Recipe? recipe}) {
    return SearchRecipeState(
        hasLoaded: hasLoaded ?? this.hasLoaded,
        statusBarHeight: statusBarHeight ?? this.statusBarHeight,
        touchedIndex: touchedIndex ?? this.touchedIndex,
        recipe: recipe ?? this.recipe);
  }
}
