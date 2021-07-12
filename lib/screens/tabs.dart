import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/categories.dart';
import '../screens/favorites.dart';
import '../widgets/main_drawer.dart';

class Tabs extends StatefulWidget {
  final List<Meal> favoriteMeals;
  Tabs(this.favoriteMeals);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        "Pages": Categories(),
        "Title": "CATEGORIES",
      },
      {"Pages": Favorites(widget.favoriteMeals), "Title": "FAVORITES"}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            _pages[_selectedPageIndex]["Title"],
          ),
        ),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _pages[_selectedPageIndex]['Pages'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        selectedFontSize: 20,
        unselectedFontSize: 15,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.category,
            ),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.favorite,
            ),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
// DefaultTabController(
//   length: 2,
//   initialIndex: 0,
//   child:
