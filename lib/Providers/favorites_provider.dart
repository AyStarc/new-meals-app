import 'package:riverpod/riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  void toggleMealFavoriteStatus(Meal meal) {
    final isMealFav = state.contains(meal); // boolean, what status is for?

    if (isMealFav) {
      state = state
          .where((meall) => meall.id != meal.id)
          .toList(); // if meal is fav then include all other items in the list
    } else {
      state = [meal, ...state]; // way to create list when list immutable.
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider((ref) {
  return FavoriteMealsNotifier();
});
