import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Costly,
  Luxurious,
}

class Meal {
  final String id;
  final String title;
  final double duration;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final List<String> categories;
  final List<String> ingredients;

  Meal(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.affordability,
      @required this.complexity,
      @required this.categories,
      @required this.ingredients,
      @required this.steps,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian});
}
