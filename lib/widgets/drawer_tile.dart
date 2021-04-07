import 'package:flutter/material.dart';
import 'package:meal_app/screens/tabs_screen.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onPressed;
  DrawerTile(
      {@required this.title, @required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 26,
          fontFamily:'RobotoCondensed',
        ),
      ),
      onTap: onPressed,
    );
  }
}
