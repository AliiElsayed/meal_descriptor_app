import 'package:flutter/material.dart';
import 'package:meal_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeRadioListTile extends StatelessWidget {
  final String tileTitle;
  final IconData themeIcon;
  final ThemeMode modeVal;
  ThemeRadioListTile(
      {@required this.tileTitle,
        @required this.themeIcon,
        @required this.modeVal});

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text(tileTitle),
      secondary: Icon(
        themeIcon,
        color: Theme.of(context).iconTheme.color,
      ),
      value: modeVal,
      groupValue: Provider.of<ThemeProvider>(context,listen: true).thMode,
      onChanged: (newVal) {
        Provider.of<ThemeProvider>(context,listen: false).changeThemeMode(newVal);
      },
    );
  }
}
