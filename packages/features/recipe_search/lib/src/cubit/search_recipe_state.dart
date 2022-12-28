part of 'search_recipe_cubit.dart';

class SearchRecipeState extends Equatable {
  final bool hasLoaded;
  final double statusBarHeight;
  const SearchRecipeState(
      {required this.hasLoaded, required this.statusBarHeight});

  @override
  List<Object> get props => [hasLoaded, statusBarHeight];

  SearchRecipeState copyWith({bool? hasLoaded, double? statusBarHeight}) {
    return SearchRecipeState(
        hasLoaded: hasLoaded ?? this.hasLoaded,
        statusBarHeight: statusBarHeight ?? this.statusBarHeight);
  }
}
