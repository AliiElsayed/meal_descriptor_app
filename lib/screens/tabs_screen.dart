import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  static const String id = 'TabsScreen';
  final List<Meal> favorites;
  TabsScreen(this.favorites);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> _pages;

  int _selectedItemIndex = 0;
  void _itemPressed(int indexVal) {
    setState(() {
      _selectedItemIndex = indexVal;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'title': 'Categories',
        'page': CategoriesScreen(),
      },
      {
        'title': 'Favorites',
        'page': FavoritesScreen(
          favoriteMeals: widget.favorites,
        ),
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
            label: 'Categories',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
