import 'package:flutter/material.dart';
import 'package:meal_app/providers/language_provider.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/widgets/category_container.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  static const String id = 'HomePage';
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<LanguageProvider>(context);
    return Directionality(
        textDirection:langProvider.isEnglish ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        body: GridView(
          padding: EdgeInsets.all(10.0),
          children: Provider.of<MealProvider>(context)
              .availableCategories
              .map((category) {
            return CategoryContainer(
              catId: category.id,
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
      ),
    );
  }
}
