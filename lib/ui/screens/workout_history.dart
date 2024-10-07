import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Workout {
  final String exerciseType;
  final String exercise;
  final int reps;
  final int sets;
  final double weight;
  final Duration duration;
  final double distance;
  final int caloriesBurned;

  Workout({
    required this.exerciseType,
    required this.exercise,
    required this.reps,
    required this.sets,
    required this.weight,
    required this.duration,
    required this.distance,
    required this.caloriesBurned,
  });
}

class WorkoutHistoryScreen extends StatelessWidget {
  WorkoutHistoryScreen({super.key});

  final List<Workout> workouts = [
    Workout(
      exerciseType: 'Cardio',
      exercise: 'Running',
      reps: 0,
      sets: 0,
      weight: 0,
      duration: Duration(minutes: 30),
      distance: 5.0,
      caloriesBurned: 300,
    ),
    Workout(
      exerciseType: 'Strength',
      exercise: 'Bicep Curls',
      reps: 13,
      sets: 5,
      weight: 80,
      duration: Duration(minutes: 0),
      distance: 0,
      caloriesBurned: 500,
    ),
    // Add more workout instances here
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          'Workout History',
        ),
        backgroundColor: CupertinoTheme.of(context).primaryColor,
        border: null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('10/01/2024'),
                const Text('to'),
                const Text('10/31/2024'),
                CupertinoButton(
                  onPressed: () {},
                  child: const Text('Change Date'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: workouts.length,
                itemBuilder: (context, index) {
                  final workout = workouts[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Exercise Type: ${workout.exerciseType}'),
                          Text('Exercise: ${workout.exercise}'),
                          Text('Reps: ${workout.reps}'),
                          Text('Sets: ${workout.sets}'),
                          Text('Weight: ${workout.weight} kg'),
                          Text(
                              'Duration: ${workout.duration.inMinutes} minutes'),
                          Text('Distance: ${workout.distance} km'),
                          Text('Calories Burned: ${workout.caloriesBurned}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
