import 'package:flutter/material.dart';
import '../models/recipe.dart';

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;
  final Function(String) toggleFavorite;

  const DetailsScreen({super.key, required this.recipe, required this.toggleFavorite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🍲 ${recipe.name}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('🥕 Ingredients: ${recipe.ingredients}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('🍳 Instructions: ${recipe.instructions}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
              onPressed: () {
                toggleFavorite(recipe.name);
                Navigator.pop(context);
              },
              child: Text(recipe.isFavorite ? '💔 Unfavorite' : '❤️ Favorite'),
            ),
          ],
        ),
      ),
    );
  }
}
