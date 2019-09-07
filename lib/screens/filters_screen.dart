import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  final Function saveFilter;
  final Map<String, bool> filters;

  FiltersScreen(this.filters, this.saveFilter);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree;
  bool _lactoseFree;
  bool _isVegan;
  bool _isVegetarian;

  @override
  initState() {
    _glutenFree = widget.filters['gluten'];
    _lactoseFree = widget.filters['lactose'];
    _isVegan = widget.filters['vegan'];
    _isVegetarian = widget.filters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchTileContainer(
      String title, String desc, bool value, Function updateValue) {
    return SwitchListTile(
      value: value,
      title: Text(title),
      subtitle: Text(desc),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save_alt),
            onPressed: () {
              final Map<String, bool> selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian,
              };
              widget.saveFilter(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          _buildSwitchTileContainer(
              "Gluten-Free", "Select to get gluten-free meals", _glutenFree,
              (newValue) {
            setState(() {
              _glutenFree = newValue;
            });
          }),
          _buildSwitchTileContainer(
              "Lactose-Free", "Select to get lactose-free meals", _lactoseFree,
              (newValue) {
            setState(() {
              _lactoseFree = newValue;
            });
          }),
          _buildSwitchTileContainer(
              "Vegan", "Select to get vegan meals", _isVegan, (newValue) {
            setState(() {
              _isVegan = newValue;
            });
          }),
          _buildSwitchTileContainer(
              "Vegetarian", "Select to get vegetarian meals", _isVegetarian,
              (newValue) {
            setState(() {
              _isVegetarian = newValue;
            });
          }),
        ],
      ),
    );
  }
}
