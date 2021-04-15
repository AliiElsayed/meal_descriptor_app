import 'package:flutter/material.dart';

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
        icon, size: 28.0,
        color: Theme.of(context).iconTheme.color,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 26,
          fontFamily:'RobotoCondensed',
          color: Theme.of(context).textTheme.bodyText1.color,
        ),
      ),
      onTap: onPressed,
    );
  }
}
