import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// --- DATA MODEL ---
class Recipe {
  final String name;
  final List<String> ingredients;
  final String instructions;

  Recipe(this.name, this.ingredients, this.instructions);
}

// --- DUMMY DATA ---
final List<Recipe> recipes = [
  Recipe(
    'High-Protein Oats',
    ['1 cup Oats', '1 scoop Whey Protein', '1 tbsp Peanut Butter', '1/2 cup Milk'],
    '1. Mix oats and milk in a bowl.\n2. Microwave for 2 minutes.\n3. Stir in protein powder and peanut butter until smooth.',
  ),
  Recipe(
    'Tandoori Chicken',
    ['500g Chicken Breast', '1/2 cup Greek Yogurt', '2 tbsp Tandoori Masala', '1 tsp Lemon Juice'],
    '1. Marinate chicken in yogurt, masala, and lemon juice for 2 hours.\n2. Preheat oven or air fryer to 200°C.\n3. Cook for 15-20 minutes until charred and cooked through.',
  ),
  Recipe(
    'Soya Chunks Curry',
    ['1 cup Soya Chunks', '1 Onion, chopped', '2 Tomatoes, pureed', '1 tsp Garam Masala'],
    '1. Boil soya chunks in salted water, squeeze out excess water.\n2. Sauté onions, add tomato puree and spices.\n3. Add soya chunks, simmer for 10 minutes.',
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipeListScreen(),
    );
  }
}

// --- SCREEN 1: THE LIST ---
class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Recipes'),
        backgroundColor: Colors.orangeAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: const Icon(Icons.restaurant_menu, color: Colors.orangeAccent),
              title: Text(recipe.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to detail screen and pass the recipe data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailScreen(recipe: recipe),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// --- SCREEN 2: THE DETAILS ---
class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe; // Receives the specific recipe

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
        backgroundColor: Colors.orangeAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ingredients:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Loop through ingredients and create text widgets
            ...recipe.ingredients.map((ingredient) => Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text('• $ingredient', style: const TextStyle(fontSize: 16)),
                )),
            const Divider(height: 30, thickness: 2),
            const Text(
              'Instructions:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              recipe.instructions,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}