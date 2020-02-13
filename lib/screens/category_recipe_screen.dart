import 'package:flutter/material.dart';

import '../models/recipe.dart';
import './../widgets/recipe_item.dart';

class CategoryRecipeScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Recipe> availableRecipes;

  CategoryRecipeScreen(this.availableRecipes);

  @override
  _CategoryRecipeScreenState createState() => _CategoryRecipeScreenState();
}

class _CategoryRecipeScreenState extends State<CategoryRecipeScreen> {
  String categoryTitle;
  List<Recipe> displayedRecipe;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  void _removeMeal(String recipeId) {
    setState(() {
      displayedRecipe.removeWhere((recipe) => recipe.id == recipeId);
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedRecipe = widget.availableRecipes.where((recipe) {
        return recipe.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedRecipe[index].id,
            title: displayedRecipe[index].title,
            imageUrl: displayedRecipe[index].imageUrl,
            duration: displayedRecipe[index].duration,
            complexity: displayedRecipe[index].complexity,
            affordability: displayedRecipe[index].affordability,
            //removeItem: _removeMeal,
          );
        },
        itemCount: displayedRecipe.length,
      ),
    );
  }
}
