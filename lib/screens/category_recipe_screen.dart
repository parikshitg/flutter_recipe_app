import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/models/recipe.dart';

import './../dummy_data.dart';

class CategoryRecipeScreen extends StatelessWidget {

  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryRecipes = DUMMY_RECIPES.where((recipe) {
      return recipe.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),),
          body: ListView.builder(itemBuilder: (ctx, index){
            return Text(categoryRecipes[index].title);
          },
          itemCount: categoryRecipes.length,),
    );
  }
}