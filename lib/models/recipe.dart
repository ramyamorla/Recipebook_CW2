class Recipe {
  final String name;
  final String ingredients;
  final String instructions;
  bool isFavorite;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
    this.isFavorite = false,
  });

  static List<Recipe> sampleRecipes = [
    Recipe(name: 'Pasta', ingredients: 'Noodles, Sauce, Olive Oil, Garlic, Basil', instructions: 'Boil noodles in salted water, sauté garlic in olive oil, add sauce and basil. Toss noodles and sauce together.'),
    Recipe(name: 'Pizza', ingredients: 'Dough, Cheese, Sauce, Pepperoni, Mushrooms, Olives', instructions: 'Prepare dough, spread sauce, add cheese and toppings, bake at 400°F for 15 minutes or until golden.'),
    Recipe(name: 'Salad', ingredients: 'Lettuce, Tomatoes, Cucumber, Carrots, Olive Oil, Lemon Juice', instructions: 'Chop vegetables, mix with olive oil and lemon juice. Add salt and pepper to taste.'),
    Recipe(name: 'Burger', ingredients: 'Bun, Patty, Lettuce, Tomato, Cheese, Ketchup, Mustard', instructions: 'Grill patty, toast buns, assemble with lettuce, tomato, cheese, and condiments.'),
    Recipe(name: 'Tacos', ingredients: 'Tortilla, Beef, Cheese, Salsa, Sour Cream, Lettuce', instructions: 'Cook beef with seasoning, warm tortillas, fill with beef, cheese, salsa, and sour cream.'),
    Recipe(name: 'Sushi', ingredients: 'Rice, Fish (Salmon, Tuna), Seaweed, Vinegar, Soy Sauce, Wasabi', instructions: 'Cook rice and mix with vinegar. Roll rice with fish and seaweed, cut into pieces. Serve with soy sauce and wasabi.'),
    Recipe(name: 'Chocolate Cake', ingredients: 'Flour, Cocoa, Sugar, Eggs, Butter, Baking Powder, Milk', instructions: 'Mix dry ingredients, add wet ingredients, bake at 350°F for 25 minutes. Let cool and frost with chocolate ganache.'),
    Recipe(name: 'Pancakes', ingredients: 'Flour, Milk, Eggs, Syrup, Butter, Baking Powder', instructions: 'Mix wet and dry ingredients, cook on skillet until golden, serve with syrup and butter.'),
  ];
}
