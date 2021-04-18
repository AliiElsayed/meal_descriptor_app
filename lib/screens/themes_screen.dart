import 'package:flutter/material.dart';
import 'package:meal_app/providers/theme_provider.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:meal_app/widgets/theme_radio_listtile.dart';
import 'package:meal_app/widgets/theme_picker_tile.dart';
import 'package:provider/provider.dart';

class ThemesScreen extends StatefulWidget {
  static const String id = 'ThemesScreen';

  @override
  _ThemesScreenState createState() => _ThemesScreenState();
}

class _ThemesScreenState extends State<ThemesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Themes'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Adjust Your Theme ',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  child: Text(
                    'Choose Your Theme Mode',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                ),
                ThemeRadioListTile(
                    tileTitle: 'System Default Theme',
                    themeIcon: null,
                    modeVal: ThemeMode.system),
                ThemeRadioListTile(
                  tileTitle: 'Light Theme',
                  themeIcon: Icons.wb_sunny_outlined,
                  modeVal: ThemeMode.light,
                ),
                ThemeRadioListTile(
                  tileTitle: 'Dark Theme',
                  themeIcon: Icons.nights_stay_outlined,
                  modeVal: ThemeMode.dark,
                ),
                SizedBox(
                  height: 20.0,
                ),
                ThemePickerTile(
                  name: 'Primary',
                ),
                SizedBox(
                  height: 10.0,
                ),
                ThemePickerTile(
                  name: 'Accent',
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical:40.0, horizontal: 100),
                  child: TextButton(
                    onPressed: () {
                      Provider.of<ThemeProvider>(context, listen: false).getDefaultColors();
                    },
                    child: Text('Default Colors',style: TextStyle(
                      color: Theme.of(context).primaryColor,

                    ),),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
