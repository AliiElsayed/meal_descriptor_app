import 'package:flutter/material.dart';
import 'package:meal_app/providers/language_provider.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/providers/theme_provider.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
  static const String id = 'TabsScreen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> _pages;
  var langProvider ;

  int _selectedItemIndex = 0;
  void _itemPressed(int indexVal) {
    setState(() {
      _selectedItemIndex = indexVal;
    });
  }


  @override
  void initState() {
    Provider.of<MealProvider>(context,listen: false).getData();
    Provider.of<MealProvider>(context,listen: false).setFilters();
    Provider.of<ThemeProvider>(context,listen: false).getTheme();
    Provider.of<LanguageProvider>(context,listen: false).getLang();

   langProvider =Provider.of<LanguageProvider>(context, listen:false );

    _pages = [
      {
        'title':langProvider.getTexts('categories'),
        'page': CategoriesScreen(),
      },
      {
        'title': langProvider.getTexts('your_favorites'),
        'page': FavoritesScreen(),
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedItemIndex]['title'],
        ),
      ),
      body: _pages[_selectedItemIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _itemPressed,
        currentIndex: _selectedItemIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: langProvider.getTexts('categories'),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: langProvider.getTexts('your_favorites'),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
