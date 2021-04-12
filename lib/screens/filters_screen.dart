import 'package:flutter/material.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatefulWidget {
  static const String id = 'FiltersScreen';
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
   bool _glutenFree = false;
   bool _lactoseFree = false;
   bool _vegetarian = false;
   bool _vegan = false;


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
    );
  }

  @override
  void didChangeDependencies() {
    final Map<String, bool> receivedFilters=Provider.of<MealProvider>(context).filters;
    _glutenFree = receivedFilters['gluten-free'];
    _lactoseFree = receivedFilters['lactose-free'];
    _vegetarian = receivedFilters['vegetarian'];
    _vegan = receivedFilters['vegan'];
    super.didChangeDependencies();
  }
  @override
  void initState() {
    // _glutenFree = receivedFilters['gluten-free'];
    // _lactoseFree = receivedFilters['lactose-free'];
    // _vegetarian = receivedFilters['vegetarian'];
    // _vegan = receivedFilters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final Map<String, bool> changedFilters = {
                  'gluten-free': _glutenFree,
                  'lactose-free': _lactoseFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                };
                Provider.of<MealProvider>(context,listen: false).setFilters(changedFilters);
                Fluttertoast.showToast(
                    msg: "Filters Saved",
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
              'Adjust your meal selections.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  title: 'Gluten-Free',
                  description: 'Only include Gluten-free Meals',
                  switchCurrentValue: _glutenFree,
                  update: (newVal) {
                    setState(() {
                      _glutenFree = newVal;
                    });
                  },
                ),
                buildSwitchListTile(
                  title: 'Lactose free',
                  description: 'Only include Lactose free Meals',
                  switchCurrentValue: _lactoseFree,
                  update: (newVal) {
                    setState(() {
                      _lactoseFree = newVal;
                    });
                  },
                ),
                buildSwitchListTile(
                  title: 'Vegetarian',
                  description: 'Only include Vegetarian Meals',
                  switchCurrentValue: _vegetarian,
                  update: (newVal) {
                    setState(() {
                      _vegetarian = newVal;
                    });
                  },
                ),
                buildSwitchListTile(
                  title: 'vegan',
                  description: 'Only include vegan Meals',
                  switchCurrentValue: _vegan,
                  update: (newVal) {
                    setState(() {
                      _vegan = newVal;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
