import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_card.dart';

class CatMealsScreen extends StatefulWidget {
  static const String id = 'MealsScreen';
  final List<Meal> filteredMeals ;
  CatMealsScreen(this.filteredMeals);
  @override
  _CatMealsScreenState createState() => _CatMealsScreenState();
}

class _CatMealsScreenState extends State<CatMealsScreen> {
  List<Meal> categoryWantedMeals ;
  String catName;

  @override
  void didChangeDependencies() {
    final receivedData =
    ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String catId = receivedData['id'];
    catName = receivedData['name'];
    categoryWantedMeals = widget.filteredMeals.where((meal) {
      return meal.categories.contains(catId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String receivedId) {
    setState(() {
      categoryWantedMeals.removeWhere((meal){
        return meal.id == receivedId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$catName Recipes'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: categoryWantedMeals.length,
        itemBuilder: (context, index) {
          return MealCard(
            id: categoryWantedMeals[index].id,
            mealName: categoryWantedMeals[index].title,
            imagePath: categoryWantedMeals[index].imageUrl,
            affordability: categoryWantedMeals[index].affordability,
            complexity: categoryWantedMeals[index].complexity,
            duration: categoryWantedMeals[index].duration,
            removeMeal: _removeMeal,
          );
        },
      ),
    );
  }
}
