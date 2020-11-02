import 'package:Meal_App/models/meal.dart';

import '../widgets/main_drawer.dart';

import './favorite_screen.dart';
import 'package:flutter/material.dart';

import './categories_screen.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> _favoritesMeals;

  const TabsScreen(this._favoritesMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
    {
    'page': CategoriesScreen(),
    'title': 'Categories'
    },
    {
    'page': FavoriteScreen(widget._favoritesMeals),
    'title': 'Your Favorites'
    }
    ];
    super.initState();
  }

  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites')
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
