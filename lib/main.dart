import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:meal_app/used_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> filteredData = usedMeals;
  List<Meal> favoriteMeals = [];
  void _toggleFavorites(String mealId) {
    setState(() {
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
    });
  }

  bool _isFavoriteMeal(String mealId) {
   return favoriteMeals.any((meal) {
      return meal.id == mealId;
    });
  }

  Map<String, bool> _filters = {
    'gluten-free': false,
    'lactose-free': false,
    'vegetarian': false,
    'vegan': false,
  };
  void _setFilters(Map<String, bool> editedSettings) {
    setState(() {
      _filters = editedSettings;
      filteredData = usedMeals.where((meal) {
        if (_filters['gluten-free'] == true && meal.isGlutenFree == false) {
          return false;
        }
        if (_filters['lactose-free'] == true && meal.isLactoseFree == false) {
          return false;
        }
        if (_filters['vegetarian'] == true && meal.isVegetarian == false) {
          return false;
        }
        if (_filters['vegan'] == true && meal.isVegan == false) {
          return false;
        }
        print('done');
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal Descriptor',
      initialRoute: TabsScreen.id,
      routes: {
        TabsScreen.id: (context) => TabsScreen(favoriteMeals),
        FiltersScreen.id: (context) => FiltersScreen(
              doFilters: _setFilters,
              receivedFilters: _filters,
            ),
        CategoriesScreen.id: (context) => CategoriesScreen(),
        CatMealsScreen.id: (context) => CatMealsScreen(filteredData),
        MealDetailsScreen.id: (context) => MealDetailsScreen(
              toggleFavorites: _toggleFavorites,
              isFavorite: _isFavoriteMeal,
            ),
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
    );
  }
}
