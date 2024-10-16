import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DailyHabit {
  final List habits;
  final double hoursSlept;
  final double waterIntake;
  final String mood;
  final String moodNotes;
  final String date;
  final String journal;

  DailyHabit({
    required this.habits,
    required this.hoursSlept,
    required this.waterIntake,
    required this.mood,
    required this.moodNotes,
    required this.date,
    required this.journal,
  });
}

class HabitHistoryScreen extends StatelessWidget {
  HabitHistoryScreen({super.key});

  final List<DailyHabit> habitItems = [
    DailyHabit(
      habits: [
        'Brush Teeth',
        'Meditate',
        'Read',
        'Exercise',
        'Journal',
      ],
      hoursSlept: 8.0,
      waterIntake: 64.0,
      mood: 'Happy',
      moodNotes: 'Feeling great today!',
      date: '01/01/2022',
      journal: 'Today was a great day!',
    ),
    DailyHabit(
      habits: [
        'Brush Teeth',
        'Meditate',
        'Read',
        'Exercise',
        'Journal',
      ],
      hoursSlept: 8.0,
      waterIntake: 64.0,
      mood: 'Happy',
      moodNotes: 'Feeling great today!',
      date: '01/02/2022',
      journal: 'Today was a great day!',
    ),
    // Add more DailyHabit instances here
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Habit History'),
        backgroundColor: CupertinoTheme.of(context).primaryColor,
        border: null,
      ),
      child: ListView.builder(
        itemCount: habitItems.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Date: ${habitItems[index].date}'),
                    subtitle: Text('Mood: ${habitItems[index].mood}'),
                  ),
                  ListTile(
                    title: Text('Hours Slept: ${habitItems[index].hoursSlept}'),
                    subtitle:
                        Text('Water Intake: ${habitItems[index].waterIntake}'),
                  ),
                  ListTile(
                    title:
                        Text('Habits: ${habitItems[index].habits.join(', ')}'),
                  ),
                  ListTile(
                    title: Text('Mood Notes: ${habitItems[index].moodNotes}'),
                  ),
                  ListTile(
                    title: Text('Journal: ${habitItems[index].journal}'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
