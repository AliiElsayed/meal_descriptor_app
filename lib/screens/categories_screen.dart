import 'package:flutter/material.dart';
import 'package:meal_app/used_data.dart';
import 'package:meal_app/widgets/category_container.dart';

class CategoryHomePage extends StatefulWidget {
  static const String id = 'HomePage';
  @override
  _CategoryHomePageState createState() => _CategoryHomePageState();
}

class _CategoryHomePageState extends State<CategoryHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal'),
        centerTitle: true,
      ),
      body: GridView(
        padding: EdgeInsets.all(10.0),
        children: usedCategories.map((category) {
          return CategoryContainer(
            catId: category.id,
            name: category.title,
            color: category.categoryColor,
          );
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10.0,
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 10.0,
        ),
      ),
    );
  }
}

