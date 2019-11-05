import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Category Recipes')),
      body: Center(
        child: Text('Recipes for the category'),
      ),
    );
  }
}
