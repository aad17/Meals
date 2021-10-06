import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen({
    this.saveFilters,
    this.currentFilters,
  });

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  value: _glutenFree,
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                  title: Text('Gluten Free'),
                  subtitle: Text('Only include gluten free meals'),
                ),
                SwitchListTile(
                  value: _vegetarian,
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                  title: Text('Vegetarian'),
                  subtitle: Text('Only include Vegetarian meals'),
                ),
                SwitchListTile(
                  value: _vegan,
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                  title: Text('Vegan'),
                  subtitle: Text('Only include vegan meals'),
                ),
                SwitchListTile(
                  value: _lactoseFree,
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                  title: Text('Lactose Free'),
                  subtitle: Text('Only include lactose free meals'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
