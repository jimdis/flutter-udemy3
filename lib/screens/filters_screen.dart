import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> currentFilters;
  final Function saveFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Map<String, bool> _activeFilters;

  @override
  initState() {
    _activeFilters = widget.currentFilters;
    super.initState();
  }

  // var _glutenFree = false;
  // var _vegetarian = false;
  // var _vegan = false;
  // var _lactoseFree = false;

  Widget _buildSwitchListTile(
      String title, String description, String filterKey) {
    return SwitchListTile(
      title: Text(title),
      value: _activeFilters[filterKey],
      subtitle: Text(description),
      onChanged: (newValue) {
        setState(() {
          _activeFilters[filterKey] = newValue;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.saveFilters(_activeFilters);
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
              'Adjust your meal settings',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals',
                  'gluten',
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals',
                  'lactose',
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals',
                  'vegetarian',
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals',
                  'vegan',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
