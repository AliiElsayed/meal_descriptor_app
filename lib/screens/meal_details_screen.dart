import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:meal_app/used_data.dart';
import 'package:provider/provider.dart';
import 'package:meal_app/providers/meal_provider.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String id = 'MealDetailsScreen';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = usedMeals.firstWhere((meal) {
      return meal.id == mealId;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 190,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 10.0),
              child: Hero(
                tag: 'mealImage$mealId',
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            titleContainer(context, 'Ingredients'),
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              height: 170,
              width: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: TextStyle(
                            color: useWhiteForeground(Theme.of(context).accentColor)
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
            titleContainer(context, 'Steps'),
            Container(
              height: 200,
              width: 350,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor:
                                Theme.of(context).primaryColor.withOpacity(0.9),
                          ),
                          title: Text(
                            '${selectedMeal.steps[index]}',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Divider(
                          height: 3.0,
                          thickness: 2.0,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {
          Provider.of<MealProvider>(context, listen: false)
              .toggleFavorites(mealId);
        },
        child: Provider.of<MealProvider>(context, listen: true)
                .isFavoriteMeal(mealId)
            ? Icon(
                Icons.star,
                color: Theme.of(context).primaryColor,
              )
            : Icon(Icons.star_border),
      ),
    );
  }

  Align titleContainer(BuildContext context, String title) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
