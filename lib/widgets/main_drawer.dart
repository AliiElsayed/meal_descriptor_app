import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/widgets/drawer_tile.dart';
import 'package:meal_app/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(
              bottom: 10.0,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
            child: Text(
              'Cooking UP!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor,
                fontFamily:'RobotoCondensed',
              ),
            ),
          ),
          DrawerTile(
            title: 'Meals',
            icon: Icons.restaurant,
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(TabsScreen.id);
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          DrawerTile(
            title: 'Filters',
            icon: Icons.settings,
            onPressed: (){
              Navigator.of(context).pushReplacementNamed(FiltersScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
