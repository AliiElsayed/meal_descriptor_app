import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/widgets/meal_card.dart';
import 'package:provider/provider.dart';

class CatMealsScreen extends StatefulWidget {
  static const String id = 'MealsScreen';
  @override
  _CatMealsScreenState createState() => _CatMealsScreenState();
}

class _CatMealsScreenState extends State<CatMealsScreen> {
  List<Meal> categoryWantedMeals;
  String catName;

  @override
  void didChangeDependencies() {
    final List<Meal> filteredMeals =
        Provider.of<MealProvider>(context).filteredMls;
    final receivedData =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String catId = receivedData['id'];
    catName = receivedData['name'];
    categoryWantedMeals = filteredMeals.where((meal) {
      return meal.categories.contains(catId);
    }).toList();
    super.didChangeDependencies();
  }

  // void _removeMeal(String receivedId) {
  //   setState(() {
  //     categoryWantedMeals.removeWhere((meal){
  //       return meal.id == receivedId;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('$catName Recipes'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:
          (deviceWidth<= 400)? 400 : 500,
          childAspectRatio: isLandScape
               ? deviceWidth/ (deviceHeight/0.681) // highest 0.681
               : deviceWidth/ (deviceHeight /2.2878), // highest num
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
        ),
        itemCount: categoryWantedMeals.length,
        itemBuilder: (context, index) {
          return MealCard(
            id: categoryWantedMeals[index].id,
            mealName: categoryWantedMeals[index].title,
            imagePath: categoryWantedMeals[index].imageUrl,
            affordability: categoryWantedMeals[index].affordability,
            complexity: categoryWantedMeals[index].complexity,
            duration: categoryWantedMeals[index].duration,
          );
        },
      ),
    );
  }
}
