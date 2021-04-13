import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/used_data.dart';

class MealProvider with ChangeNotifier {
  List<Meal> filteredData = usedMeals;
  List<Meal> favoriteMeals = [];
  void toggleFavorites(String mealId) {
    final retrievedIndex = favoriteMeals.indexWhere((meal) {
      return meal.id == mealId;
    });

    if (retrievedIndex >= 0) {
      favoriteMeals.removeAt(retrievedIndex);
    } else {
      favoriteMeals.add(
        usedMeals.firstWhere((meal) {
          return meal.id == mealId;
        }),
      );
    }
    notifyListeners();
  }

  bool isFavoriteMeal(String mealId) {
    return favoriteMeals.any((meal) {
      return meal.id == mealId;
    });
    notifyListeners();
  }

  Map<String, bool> filters = {
    'gluten-free': false,
    'lactose-free': false,
    'vegetarian': false,
    'vegan': false,
  };
  void setFilters() {
    filteredData = usedMeals.where((meal) {
      if (filters['gluten-free'] == true && meal.isGlutenFree == false) {
        return false;
      }
      if (filters['lactose-free'] == true && meal.isLactoseFree == false) {
        return false;
      }
      if (filters['vegetarian'] == true && meal.isVegetarian == false) {
        return false;
      }
      if (filters['vegan'] == true && meal.isVegan == false) {
        return false;
      }
      print('done');
      return true;
    }).toList();
    switchIconShape =false;
    notifyListeners();
  }

  bool switchIconShape = false;

  void checkIcon() {
    if (switchIconShape != true) {
        switchIconShape = true;
    }
  }




}
