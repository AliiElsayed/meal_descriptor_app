import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const String id ='FiltersScreen';
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Filters'),
      ),
    );
  }
}
