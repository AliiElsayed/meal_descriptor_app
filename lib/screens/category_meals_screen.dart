import 'package:flutter/material.dart';
import 'package:meal_app/used_data.dart';
import 'package:meal_app/widgets/meal_card.dart';

class CatMealsScreen extends StatefulWidget {
  static const String id = 'MealsScreen';
  @override
  _CatMealsScreenState createState() => _CatMealsScreenState();
}

class _CatMealsScreenState extends State<CatMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final receivedData =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String catId = receivedData['id'];
    final String catName = receivedData['name'];
    final filteredData = usedMeals.where((meal) {
      return meal.categories.contains(catId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$catName Recipes'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: filteredData.length,
        itemBuilder: (context, index) {
          return MealCard(
            id: filteredData[index].id,
            mealName:filteredData[index].title ,
            imagePath:filteredData[index].imageUrl ,
            affordability: filteredData[index].affordability ,
            complexity: filteredData[index].complexity ,
            duration: filteredData[index].duration,
          );
        },
      ),
    );
  }
}

