import 'package:flutter/material.dart';

class RecipeDetailsScreen extends StatelessWidget {

  static const routeName = '/recipe-details';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('Meal Detail'),),
          body: Center(
        child: Text("the MEal - $mealId"),
      ),
    );
  }
}