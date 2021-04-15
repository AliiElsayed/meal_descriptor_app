import 'package:flutter/material.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<MealProvider>(
      create: (context) => MealProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal Descriptor',
      initialRoute: TabsScreen.id,
      routes: {
        TabsScreen.id: (context) => TabsScreen(),
        FiltersScreen.id: (context) => FiltersScreen(),
        CategoriesScreen.id: (context) => CategoriesScreen(),
        CatMealsScreen.id: (context) => CatMealsScreen(),
        MealDetailsScreen.id: (context) => MealDetailsScreen(),
      },
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        shadowColor: Colors.black87,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
          bodyText2: TextStyle(
            color: Colors.black,
          ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.amber,
        iconTheme: IconThemeData(
          color: Colors.white70,
        ),
        cardColor: Color.fromRGBO(14, 22, 33, 1),
        canvasColor: Color.fromRGBO(35, 34, 39, 1),
        shadowColor: Colors.white70,
        textTheme: ThemeData.dark().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Colors.white70
          ),
          bodyText2: TextStyle(
            color: Colors.white,
          ),
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// textTheme: ThemeData.dark().textTheme.copyWith(
// bodyText1: TextStyle(
// color: Colors.white70,
// fontSize: 26,
// fontFamily:'RobotoCondensed',
// ),
// ),
// ),
