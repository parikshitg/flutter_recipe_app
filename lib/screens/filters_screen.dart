import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/fliters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Adjust your recipe selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  "Gluten Free",
                  "Only include gluten free recipes.",
                  _glutenFree,
                  (newValue) {
                    _glutenFree = newValue;
                  },
                ),
                _buildSwitchListTile(
                  "Vegetarian",
                  "Only include vegeterian recipes.",
                  _vegetarian,
                  (newValue) {
                    _vegetarian = newValue;
                  },
                ),
                _buildSwitchListTile(
                  "Vegan",
                  "Only include vegan recipes.",
                  _vegan,
                  (newValue) {
                    _vegan = newValue;
                  },
                ),
                _buildSwitchListTile(
                  "Lactose Free",
                  "Only include lactose free recipes.",
                  _lactoseFree,
                  (newValue) {
                    _lactoseFree = newValue;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
