import 'package:flutter/cupertino.dart';

import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';

  final Function saveFilters;
  final Map currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  @override
  initState() {
    _isGlutenFree = widget.currentFilters['gluten'];
    _isVegan = widget.currentFilters['vegan'];
    _isVegetarian = widget.currentFilters['vegetarian'];
    _isLactoseFree = widget.currentFilters['lactose'];

    super.initState();
  }

  Widget buildSwitchListTile(String title, String subtitle, bool currentVal,
      Function updateVal) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentVal,
      onChanged: updateVal,
    );
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
              final selectedFilters = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust Your Meal Selection.',
            style: Theme
                .of(context)
                .textTheme
                .title,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              buildSwitchListTile(
                'Gluten-Free',
                'Only Includes Gluten-Free Meals.',
                _isGlutenFree,
                    (newVal) {
                  setState(() {
                    _isGlutenFree = newVal;
                  });
                },
              ),
              buildSwitchListTile(
                'Lactose-Free',
                'Only Includes Lactose-Free Meals.',
                _isLactoseFree,
                    (newVal) {
                  setState(() {
                    _isLactoseFree = newVal;
                  });
                },
              ),
              buildSwitchListTile(
                'Vegetarian',
                'Only Includes Vegetarian Meals.',
                _isVegetarian,
                    (newVal) {
                  setState(() {
                    _isVegetarian = newVal;
                  });
                },
              ),
              buildSwitchListTile(
                'Vegan',
                'Only Includes Vegan Meals.',
                _isVegan,
                    (newVal) {
                  setState(() {
                    _isVegan = newVal;
                  });
                },
              ),
            ],
          ),
        )
      ]),
      drawer: MainDrawer(),
    );
  }
}
