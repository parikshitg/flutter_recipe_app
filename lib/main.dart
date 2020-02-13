import 'package:flutter/material.dart';

import './models/recipe.dart';
import './dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/recipe_details_screen.dart';
import './screens/category_recipe_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    "gluten": false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };

  List<Recipe> _availableRecipes = DUMMY_RECIPES;
  List<Recipe> _favoriteRecipes = [];

  void _setFilters(Map<String, bool> filterData){
    setState(() {
      _filters = filterData;
      _availableRecipes = DUMMY_RECIPES.where((recipe){
        if(_filters['gluten'] && !recipe.isGlutenFree){
          return false;
        }
        if(_filters['vegan'] && !recipe.isVegan){
          return false;
        }
        if(_filters['vegetarian'] && !recipe.isVegetarian){
          return false;
        }
        if(_filters['lactose'] && !recipe.isLactoseFree){
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String recipeId){
    final existingIndex = _favoriteRecipes.indexWhere((recipe) => recipe.id == recipeId);

    if (existingIndex >= 0){
      setState(() {
        _favoriteRecipes.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteRecipes.add(DUMMY_RECIPES.firstWhere((recipe) => recipe.id == recipeId));
      });
    }
  }

  bool _isRecipeFavorite(String id){
    return _favoriteRecipes.any((recipe) => recipe.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20.0,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: CategoriesScreen(),
      initialRoute: "/",
      routes: {
        "/": (ctx) => TabsScreen(_favoriteRecipes),   //this is the home route
        CategoryRecipeScreen.routeName: (ctx) => CategoryRecipeScreen(_availableRecipes),
        RecipeDetailsScreen.routeName: (ctx) => RecipeDetailsScreen(_toggleFavorite, _isRecipeFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      onUnknownRoute: (settings) {
       // print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      } ,
    );
  }
}
