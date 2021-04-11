import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_card.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen({this.favoriteMeals});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favoriteMeals.isEmpty
          ? Center(
              child: Text('You have n\'t add any meals yet.', style:TextStyle(fontSize: 19.0),),
            )
          : ListView.builder(
              itemCount: favoriteMeals.length,
              itemBuilder: (context, index) {
                return MealCard(
                  // removeMeal: removeMeal,
                  id: favoriteMeals[index].id,
                  mealName: favoriteMeals[index].title,
                  duration: favoriteMeals[index].duration,
                  imagePath: favoriteMeals[index].imageUrl,
                  complexity: favoriteMeals[index].complexity,
                  affordability: favoriteMeals[index].affordability,
                );
              }),
    );
  }
}
