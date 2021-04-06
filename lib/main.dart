import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/meal_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal Descriptor',
      initialRoute: CategoryHomePage.id,
      routes: {
        CategoryHomePage.id:(context)=>CategoryHomePage(),
        CatMealsScreen.id: (context)=> CatMealsScreen(),
        MealDetailsScreen.id: (context)=> MealDetailsScreen(),
      },
      theme: ThemeData(
        primarySwatch:Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20,50, 50,1 ),
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 50, 50,1),
          ),
         headline6:TextStyle(
           fontSize: 20,
           fontFamily: 'RobotoCondensed',
           fontWeight: FontWeight.bold,
         ),

        ),

      ),

    );
  }
}

