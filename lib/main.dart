import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'models/recipe.dart';

void main() {
  runApp(RecipeBookApp());
}

class RecipeBookApp extends StatefulWidget {
  const RecipeBookApp({super.key});

  @override
  _RecipeBookAppState createState() => _RecipeBookAppState();
}

class _RecipeBookAppState extends State<RecipeBookApp> {
  List<Recipe> recipes = Recipe.sampleRecipes;

  void toggleFavorite(String name) {
    setState(() {
      final recipe = recipes.firstWhere((r) => r.name == name);
      recipe.isFavorite = !recipe.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.orange[100],
        appBarTheme: AppBarTheme(
          color: Colors.deepOrange,
          titleTextStyle: TextStyle(fontFamily: 'Pacifico', fontSize: 28, color: Colors.white),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Lobster', fontSize: 20, color: Colors.brown[800]),
          bodyMedium: TextStyle(fontFamily: 'Lobster', fontSize: 18, color: Colors.brown[700]),
        ),
      ),
      home: HomeScreen(recipes: recipes, toggleFavorite: toggleFavorite),
    );
  }
}
