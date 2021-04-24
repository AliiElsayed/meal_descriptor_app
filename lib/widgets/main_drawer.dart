import 'package:flutter/material.dart';
import 'package:meal_app/providers/language_provider.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/themes_screen.dart';
import 'package:meal_app/widgets/drawer_tile.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<LanguageProvider>(context);
    return Directionality(
      textDirection:
          langProvider.isEnglish ? TextDirection.ltr : TextDirection.rtl,
      child: Drawer(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(
                  bottom: 10.0,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Text(
                    langProvider.getTexts('drawer_name'),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'RobotoCondensed',
                    ),
                  ),
                ),
              ),
              DrawerTile(
                title: langProvider.getTexts('drawer_item1'),
                icon: Icons.restaurant,
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(TabsScreen.id);
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              DrawerTile(
                title: langProvider.getTexts('drawer_item2'),
                icon: Icons.settings,
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(FiltersScreen.id);
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              DrawerTile(
                title: langProvider.getTexts('drawer_item3'),
                icon: Icons.color_lens,
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(ThemesScreen.id);
                },
              ),
              Divider(
                color: Colors.black54,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        langProvider.getTexts('drawer_switch_title'),
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'RobotoCondensed',
                          color: Theme.of(context).textTheme.bodyText1.color,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:5.0, horizontal: 32.0),
                      child: Row(
                        children: [
                          Text(
                            langProvider.getTexts('drawer_switch_item2'),
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'RobotoCondensed',
                              color: Theme.of(context).textTheme.bodyText1.color,
                            ),
                          ),
                          Switch(
                              value: Provider.of<LanguageProvider>(context)
                                  .isEnglish,
                              onChanged: (newVal) {
                                Provider.of<LanguageProvider>(context,listen: false)
                                    .changeLanguage(newVal);
                              }),
                          Text(
                            langProvider.getTexts('drawer_switch_item1'),
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'RobotoCondensed',
                              color: Theme.of(context).textTheme.bodyText1.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
