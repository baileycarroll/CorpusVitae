import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Meal {
  final String mealType;
  final String meal;
  final double calories;
  final double grams;
  final double servings;
  double protein;
  double fats;
  double carbs;
  double sugars;
  double fiber;

  Meal({
    required this.mealType,
    required this.meal,
    required this.calories,
    required this.grams,
    required this.servings,
    this.protein = 0.0,
    this.fats = 0.0,
    this.carbs = 0.0,
    this.sugars = 0.0,
    this.fiber = 0.0,
  });
}

class MealHistoryScreen extends StatelessWidget {
  MealHistoryScreen({super.key});

  final List<Meal> meals = [
    Meal(
      mealType: 'Breakfast',
      meal: 'Oatmeal',
      calories: 150.0,
      grams: 100.0,
      servings: 1.0,
      protein: 5.0,
      fats: 2.0,
      carbs: 25.0,
      sugars: 5.0,
      fiber: 3.0,
    ),
    Meal(
      mealType: 'Lunch',
      meal: 'Chicken Salad',
      calories: 300.0,
      grams: 200.0,
      servings: 1.0,
      protein: 20.0,
      fats: 10.0,
      carbs: 30.0,
      sugars: 5.0,
      fiber: 5.0,
    ),
    // Add more meal instances here
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          'Meal History',
        ),
        backgroundColor: CupertinoTheme.of(context).primaryColor,
        border: null,
      ),
      child: SafeArea(
        child: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(meals[index].mealType),
                subtitle: Text(meals[index].meal),
                trailing: Text('${meals[index].calories} cal'),
              ),
            );
          },
        ),
      ),
    );
  }
}
