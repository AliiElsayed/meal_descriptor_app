import 'package:flutter/material.dart';
import 'package:meal_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ThemePickerTile extends StatelessWidget {
  final String name;
  const ThemePickerTile({@required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Choose Your $name Color',
        style: Theme.of(context).textTheme.headline6,
      ),
      trailing: CircleAvatar(
        backgroundColor: name == 'Primary'
            ? Provider.of<ThemeProvider>(context, listen: true).primaryAppColor
            : Provider.of<ThemeProvider>(context,listen: true).accentAppColor,
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                contentPadding: EdgeInsets.all(0.0),
                content: SingleChildScrollView(
                  child: ColorPicker(
                    pickerColor: name == 'Primary'
                        ? Provider.of<ThemeProvider>(context).primaryAppColor
                        : Provider.of<ThemeProvider>(context).accentAppColor,
                    onColorChanged: (pickedColor) {
                      Provider.of<ThemeProvider>(context,listen: false)
                          .changeColor(pickedColor, name);
                    },
                    displayThumbColor: true,
                    enableAlpha: true,
                    paletteType: PaletteType.hsv,
                    colorPickerWidth: 300.0,
                    pickerAreaHeightPercent: 0.5,
                    pickerAreaBorderRadius: BorderRadius.vertical(
                      top: Radius.circular(15.0),
                    ),
                    // showLabel: false,
                  ),
                ),
              );
            });
      },
    );
  }
}
