import 'package:flutter/material.dart';
import '../models/recipe.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Recipe> recipes;

  const FavoritesScreen({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🍎 Favorite Recipes')),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/food_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: recipes.isEmpty
            ? const Center(child: Text('😢 No favorite recipes yet.', style: TextStyle(fontSize: 20)))
            : ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return Card(
                    color: Colors.orange[200],
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      leading: const Icon(Icons.restaurant, color: Colors.deepOrange),
                      title: Text(recipe.name),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
