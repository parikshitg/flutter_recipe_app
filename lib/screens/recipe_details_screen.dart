import 'package:flutter/material.dart';

import "../dummy_data.dart";

class RecipeDetailsScreen extends StatelessWidget {
  static const routeName = '/recipe-details';

  final Function toggleFavorite;
  final Function isFavorite;

  RecipeDetailsScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      height: 150.0,
      width: 300.0,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final recipeId = ModalRoute.of(context).settings.arguments as String;
    final selectedRecipe =
        DUMMY_RECIPES.firstWhere((recipe) => recipe.id == recipeId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedRecipe.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedRecipe.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemCount: selectedRecipe.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: Text(selectedRecipe.ingredients[index]),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(index + 1)}'),
                    ),
                    title: Text(
                      selectedRecipe.steps[index],
                    ),
                  ),
                  Divider(),
                ],
              ),
              itemCount: selectedRecipe.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(recipeId) ? Icons.star : Icons.star_border,
        ),
        onPressed:() => toggleFavorite(recipeId),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: () { Navigator.of(context).pop(recipeId);}, child: Icon(Icons.delete),),
    );
  }
}
