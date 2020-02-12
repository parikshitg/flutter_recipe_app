import 'package:flutter/material.dart';

class CategoryRecipeScreen extends StatelessWidget {

  final String categoryId;
  final String categoryTitle;

  CategoryRecipeScreen(this.categoryId,this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),),
          body: Center(
        child: Text(
          "Some Random Text!!",
        ),
      ),
    );
  }
}