import 'package:flutter/material.dart';

void main() {
  runApp(RecipeBookApp());
}

class RecipeBookApp extends StatefulWidget {
  @override
  _RecipeBookAppState createState() => _RecipeBookAppState();
}

class _RecipeBookAppState extends State<RecipeBookApp> {
  List<Map<String, dynamic>> recipes = [
    {'name': 'Pasta', 'ingredients': 'Noodles, Sauce', 'instructions': 'Boil noodles and add sauce.', 'isFavorite': false},
    {'name': 'Pizza', 'ingredients': 'Dough, Cheese, Sauce', 'instructions': 'Bake dough with toppings.', 'isFavorite': false},
    {'name': 'Salad', 'ingredients': 'Lettuce, Tomatoes, Cucumber', 'instructions': 'Mix all ingredients.', 'isFavorite': false},
    {'name': 'Burger', 'ingredients': 'Bun, Patty, Lettuce, Tomato', 'instructions': 'Grill patty and assemble.', 'isFavorite': false},
    {'name': 'Tacos', 'ingredients': 'Tortilla, Beef, Cheese, Salsa', 'instructions': 'Cook beef and fill tortillas.', 'isFavorite': false},
    {'name': 'Sushi', 'ingredients': 'Rice, Fish, Seaweed', 'instructions': 'Roll ingredients in seaweed.', 'isFavorite': false},
    {'name': 'Chocolate Cake', 'ingredients': 'Flour, Cocoa, Sugar, Eggs', 'instructions': 'Mix ingredients and bake.', 'isFavorite': false},
    {'name': 'Pancakes', 'ingredients': 'Flour, Milk, Eggs, Syrup', 'instructions': 'Mix and cook on skillet.', 'isFavorite': false},
  ];

  void toggleFavorite(String name) {
    setState(() {
      final recipe = recipes.firstWhere((r) => r['name'] == name);
      recipe['isFavorite'] = !recipe['isFavorite'];
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

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> recipes;
  final Function(String) toggleFavorite;

  HomeScreen({required this.recipes, required this.toggleFavorite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🍽️ Delicious Recipe Book')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('/Users/ramyamorla/Desktop/MAD/recipebook_cw2/assets/food_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.orange[200],
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: Icon(Icons.fastfood, color: Colors.deepOrange),
                title: Text(recipes[index]['name'], style: TextStyle(fontSize: 22)),
                trailing: Icon(
                  recipes[index]['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                  color: recipes[index]['isFavorite'] ? Colors.red : null,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        recipe: recipes[index],
                        toggleFavorite: toggleFavorite,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.favorite, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoritesScreen(
                recipes: recipes.where((r) => r['isFavorite']).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic> recipe;
  final Function(String) toggleFavorite;

  DetailsScreen({required this.recipe, required this.toggleFavorite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🍲 ${recipe['name']}')),
      body: Container(
        decoration: BoxDecoration(
          
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('🥕 Ingredients: ${recipe['ingredients']}', style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text('🍳 Instructions: ${recipe['instructions']}', style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
                onPressed: () {
                  toggleFavorite(recipe['name']);
                  Navigator.pop(context);
                },
                child: Text(recipe['isFavorite'] ? '💔 Unfavorite' : '❤️ Favorite'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> recipes;

  FavoritesScreen({required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🍎 Favorite Recipes')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('/Users/ramyamorla/Desktop/MAD/recipebook_cw2/assets/food_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: recipes.isEmpty
            ? Center(child: Text('😢 No favorite recipes yet.'))
            : ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.orange[200],
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      leading: Icon(Icons.restaurant, color: Colors.deepOrange),
                      title: Text(recipes[index]['name']),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
