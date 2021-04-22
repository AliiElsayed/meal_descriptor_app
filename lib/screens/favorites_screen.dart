import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/widgets/meal_card.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Meal> favoriteMeals =
        Provider.of<MealProvider>(context, listen: true).favoriteMeals;
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: favoriteMeals.isEmpty
          ? Center(
              child: Text(
                'You have n\'t add any meals yet.',
                style: TextStyle(fontSize: 19.0),
              ),
            )
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: (deviceWidth<= 400)? 400 : 500,
          childAspectRatio: isLandscape
              ? deviceWidth/ (deviceHeight/0.681)
              : deviceWidth/ (deviceHeight /2.2878),
          // childAspectRatio: isLandscape? 2.25/2 : 2.7/2,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
        ),
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
