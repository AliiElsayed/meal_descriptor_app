import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/used_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    //notifyListeners();
  }

  Map<String, bool> filters = {
    'gluten-free': false,
    'lactose-free': false,
    'vegetarian': false,
    'vegan': false,
  };
  void setFilters() async {
     print('setFilters Start !');
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
      print('setFilters end !');
      return true;
    }).toList();
    switchIconShape = false;
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool('gluten', filters['gluten-free']);
    _pref.setBool('lactose', filters['lactose-free']);
    _pref.setBool('vegetarian', filters['vegetarian']);
    _pref.setBool('vegan', filters['vegan']);

    notifyListeners();
  }

  bool switchIconShape = false;

  void checkIcon() {
    if (switchIconShape != true) {
      switchIconShape = true;
    }
  }

  void getData() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    filters['gluten-free'] = _pref.getBool('gluten')?? false;
    filters['lactose-free'] = _pref.getBool('lactose')?? false ;
    filters['vegetarian'] = _pref.getBool('vegetarian')?? false;
    filters['vegan'] = _pref.getBool('vegan') ?? false;
    notifyListeners();
  }
}
