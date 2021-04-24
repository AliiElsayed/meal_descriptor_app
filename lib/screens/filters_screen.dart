import 'package:flutter/material.dart';
import 'package:meal_app/providers/language_provider.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/providers/theme_provider.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatefulWidget {
  static const String id = 'FiltersScreen';
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  SwitchListTile buildSwitchListTile(
      {String title,
      String description,
      bool switchCurrentValue,
      Function update}) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 21),
      ),
      subtitle: Text(description),
      value: switchCurrentValue,
      onChanged: update,
      activeColor: Theme.of(context).accentColor,
      inactiveTrackColor:
          Provider.of<ThemeProvider>(context).thMode == ThemeMode.dark
              ? Colors.black87
              : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, bool> currentFilters =
        Provider.of<MealProvider>(context, listen: true).filters;
    var langProvider = Provider.of<LanguageProvider>(context);
    return Directionality(
      textDirection: langProvider.isEnglish ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(langProvider.getTexts('filters_appBar_title'),),
          actions: [
            IconButton(
                icon: Provider.of<MealProvider>(context).switchIconShape
                    ? Icon(Icons.check, color: Colors.white)
                    : Icon(Icons.save),
                onPressed: () {
                  Provider.of<MealProvider>(context, listen: false).setFilters();
                  Fluttertoast.showToast(
                    msg: langProvider.getTexts('toast_message'),
                    toastLength: Toast.LENGTH_SHORT,
                  );
                }),
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                langProvider.getTexts('filters_screen_title'),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile(
                    title:  langProvider.getTexts('Gluten-free'),
                    description: langProvider.getTexts('Gluten-free-sub'),
                    switchCurrentValue: currentFilters['gluten-free'],
                    update: (newVal) {
                      setState(() {
                        currentFilters['gluten-free'] = newVal;
                      });
                      Provider.of<MealProvider>(context, listen: false)
                          .checkIcon();
                    },
                  ),
                  buildSwitchListTile(
                    title: langProvider.getTexts('Lactose-free'),
                    description: langProvider.getTexts('Lactose-free-sub'),
                    switchCurrentValue: currentFilters['lactose-free'],
                    update: (newVal) {
                      setState(() {
                        currentFilters['lactose-free'] = newVal;
                      });
                      Provider.of<MealProvider>(context, listen: false)
                          .checkIcon();
                    },
                  ),
                  buildSwitchListTile(
                    title: langProvider.getTexts('Vegetarian'),
                    description: langProvider.getTexts('Vegetarian-sub'),
                    switchCurrentValue: currentFilters['vegetarian'],
                    update: (newVal) {
                      setState(() {
                        currentFilters['vegetarian'] = newVal;
                      });
                      Provider.of<MealProvider>(context, listen: false)
                          .checkIcon();
                    },
                  ),
                  buildSwitchListTile(
                    title: langProvider.getTexts('Vegan'),
                    description: langProvider.getTexts('Vegan-sub'),
                    switchCurrentValue: currentFilters['vegan'],
                    update: (newVal) {
                      setState(() {
                        currentFilters['vegan'] = newVal;
                      });
                      Provider.of<MealProvider>(context, listen: false)
                          .checkIcon();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        drawer: MainDrawer(),
      ),
    );
  }
}
