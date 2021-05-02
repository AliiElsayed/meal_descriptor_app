import 'package:flutter/material.dart';
import 'package:meal_app/providers/language_provider.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:provider/provider.dart';

class CategoryContainer extends StatelessWidget {
  final String catId;
  final Color color;
  final String imagePath;
  CategoryContainer({this.catId, this.color, this.imagePath});
  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<LanguageProvider>(context);
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.height;
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          CatMealsScreen.id,
          arguments: {
            'id': catId,
          },
        );
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      child: Stack(
        children: [
          Container(
            margin: isLandScape
                ? EdgeInsets.only(
                    top: 35.0,
                    right: 20.0,
                    left: 5.0,
                  )
                : EdgeInsets.only(
                    top: 30.0,
                    right: 20.0,
                    left: 5.0,
                  ),
            padding: isLandScape
                ? EdgeInsets.only(left: 10, top: 100.0)
                : EdgeInsets.only(left: 10, top: 80.0),
            height: isLandScape ? deviceHeight / 2.5 : deviceHeight / 4,
            width: deviceWidth / 2,
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
          Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                imagePath,
                height:isLandScape?120: 100.0,
                width: isLandScape?120 : 100.0,
              )),
        ],
      ),
    );
  }
}
