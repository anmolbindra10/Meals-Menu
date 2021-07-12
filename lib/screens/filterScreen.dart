import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filterScreen";
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget buildSwitchTile(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("YOUR FILTERS"),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                  'lactose': _lactoseFree,
                };
                widget.saveFilters(selectedFilters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust Your Meal Selection.",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchTile(
                      "GLUTEN FREE", "ONLY GLUTEN FREE MEALS", _glutenFree,
                      (value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  }),
                  buildSwitchTile(
                      "VEGETARIAN", "ONLY VEGETARIAN MEALS", _vegetarian,
                      (value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  }),
                  buildSwitchTile("VEGAN", "ONLY VEGAN MEALS", _vegan, (value) {
                    setState(() {
                      _vegan = value;
                    });
                  }),
                  buildSwitchTile(
                      "LACTOSE FREE", "ONLY LACTOSE FREE MEALS", _lactoseFree,
                      (value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
