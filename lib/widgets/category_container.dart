import 'package:flutter/material.dart';
import 'package:meal_app/providers/language_provider.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:provider/provider.dart';

class CategoryContainer extends StatelessWidget {
  final String catId;
  final Color color;
  CategoryContainer({this.catId,this.color});
  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<LanguageProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(CatMealsScreen.id,arguments:{
          'id':catId,
        }, );
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.3),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          langProvider.getTexts('cat-$catId'),
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
