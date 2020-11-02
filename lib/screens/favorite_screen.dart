import '../widgets/meal_item.dart';

import '../models/meal.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {

  final List<Meal> _favoritesMeals;

  FavoriteScreen(this._favoritesMeals);

  @override
  Widget build(BuildContext context) {

    if(_favoritesMeals.isEmpty){
      return Center(
        child: Text('You Have No Favorites Yet - Start Adding Some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (_, int index) {
          return MealItem(
            id: _favoritesMeals[index].id,
            imageUrl: _favoritesMeals[index].imageUrl,
            title: _favoritesMeals[index].title,
            duration: _favoritesMeals[index].duration,
            affordability: _favoritesMeals[index].affordability,
            complexity: _favoritesMeals[index].complexity,
          );
        },
        itemCount: _favoritesMeals.length,
      );
    }
  }
}
