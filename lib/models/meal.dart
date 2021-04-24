import 'package:flutter/material.dart';

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
  final double duration;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final List<String> categories;


  Meal(
      {@required this.id,
      @required this.imageUrl,
      @required this.duration,
      @required this.affordability,
      @required this.complexity,
      @required this.categories,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian});
}
