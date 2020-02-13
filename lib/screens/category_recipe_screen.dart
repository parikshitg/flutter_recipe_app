import 'package:flutter/material.dart';

import './../widgets/recipe_item.dart';
import '../dummy_data.dart';

import './../dummy_data.dart';

class CategoryRecipeScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryRecipes = DUMMY_RECIPES.where((recipe) {
      return recipe.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryRecipes[index].id,
            title: categoryRecipes[index].title,
            imageUrl: categoryRecipes[index].imageUrl,
            duration: categoryRecipes[index].duration,
            complexity: categoryRecipes[index].complexity,
            affordability: categoryRecipes[index].affordability,
          );
        },
        itemCount: categoryRecipes.length,
      ),
    );
  }
}
