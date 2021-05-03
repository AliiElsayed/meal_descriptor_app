import 'package:flutter/material.dart';
import 'package:meal_app/providers/language_provider.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/providers/onBoarding_provider.dart';
import 'package:meal_app/providers/theme_provider.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/screens/onboarding_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:meal_app/screens/themes_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
bool watched;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _pref = await SharedPreferences.getInstance();
  watched = _pref.getBool('watched')??false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MealProvider>(
          create: (context) => MealProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<LanguageProvider>(
          create: (context) => LanguageProvider(),
        ),
        ChangeNotifierProvider<OnBoardingProvider>(
          create: (context) => OnBoardingProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var usedPrimaryColor = Provider.of<ThemeProvider>(context).primaryAppColor;
    var usedAccentColor = Provider.of<ThemeProvider>(context).accentAppColor;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal Descriptor',
      initialRoute: watched ? TabsScreen.id : OnBoardingScreen.id,
      routes: {
        TabsScreen.id: (context) => TabsScreen(),
        FiltersScreen.id: (context) => FiltersScreen(),
        CategoriesScreen.id: (context) => CategoriesScreen(),
        CatMealsScreen.id: (context) => CatMealsScreen(),
        MealDetailsScreen.id: (context) => MealDetailsScreen(),
        ThemesScreen.id: (context) => ThemesScreen(),
        OnBoardingScreen.id: (context) => OnBoardingScreen(),
      },
      themeMode: Provider.of<ThemeProvider>(context, listen: true).thMode,
      theme: ThemeData(
        primarySwatch: usedPrimaryColor,
        accentColor: usedAccentColor,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        shadowColor: Colors.black87,
        fontFamily: 'Raleway',
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
        primaryColor: usedPrimaryColor,
        accentColor: usedAccentColor,
        iconTheme: IconThemeData(
          color: Colors.white70,
        ),
        cardColor: Color.fromRGBO(35, 34, 39, 1),
        canvasColor: Color.fromRGBO(14, 22, 33, 1),
        shadowColor: Colors.white70,
        fontFamily: 'Raleway',
        unselectedWidgetColor: Colors.white70,
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyText1: TextStyle(color: Colors.white70),
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
