import 'package:flutter/material.dart';

import '../widgets/recipe_item.dart';
import '../models/recipe.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Recipe> favoriteRecipes;

  FavoritesScreen(this.favoriteRecipes);

  @override
  Widget build(BuildContext context) {
    if (favoriteRecipes.isEmpty) {
      return Center(
        child: Text('You have no favorites!'),
      );
    }else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteRecipes[index].id,
            title: favoriteRecipes[index].title,
            imageUrl: favoriteRecipes[index].imageUrl,
            duration: favoriteRecipes[index].duration,
            complexity: favoriteRecipes[index].complexity,
            affordability: favoriteRecipes[index].affordability,
            //removeItem: _removeMeal,
          );
        },
        itemCount: favoriteRecipes.length,
      );
    }
  }
}
