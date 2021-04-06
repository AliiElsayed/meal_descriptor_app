import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_details_screen.dart';

class MealCard extends StatelessWidget {
  final String id;
  final String mealName;
  final double duration;
  final Complexity complexity;
  final Affordability affordability;
  final String imagePath;

  MealCard({
    @required this.id,
    @required this.mealName,
    @required this.duration,
    @required this.imagePath,
    @required this.complexity,
    @required this.affordability,
  });
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Try Yourself';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Costly:
        return 'Costly';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          MealDetailsScreen.id,
          arguments: id,
        );
      },
      child: Card(
        margin: EdgeInsets.all(10.0),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Image.network(
                    imagePath,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 1.0,
                  bottom: 20.0,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                    width: 250,
                    color: Colors.black54,
                    child: Text(
                      mealName,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  ReusableRow(complexityText: complexityText),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  const ReusableRow({
    @required this.complexityText,
  });

  final String complexityText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.work),
        SizedBox(
          width: 5.0,
        ),
        Text(complexityText),
      ],
    );
  }
}
