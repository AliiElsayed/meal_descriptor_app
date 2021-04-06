import 'package:flutter/material.dart';
import 'package:meal_app/used_data.dart';

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
              margin: EdgeInsets.only(bottom:10.0),
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              height: 170,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListView.builder(
                itemCount:selectedMeal.ingredients.length ,
                itemBuilder:(context,index){
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                } ,),
            ),
          ],
        ),
      ),
    );
  }
}
