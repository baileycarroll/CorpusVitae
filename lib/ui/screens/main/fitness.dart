// Base Packages
import 'package:flutter/cupertino.dart';
// Widgets
import 'package:corpus_vitae/ui/screens/history/fitness.dart';
import 'package:corpus_vitae/ui/widgets/circular_progress.dart';
import 'package:corpus_vitae/ui/widgets/exercise_types_dropdown.dart';
// Date Formatting
import 'package:intl/intl.dart';

class FitnessTrackingScreen extends StatelessWidget {
  final CupertinoTabController tabController; // Accept the tab controller

  const FitnessTrackingScreen({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          DateFormat('MM/dd/yyyy').format(DateTime.now()).toString(),
        ),
        trailing: GestureDetector(
          onTap: () {
            // Open WorkoutHistoryScreen within the Fitness tab's navigation stack
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => WorkoutHistoryScreen(),
              ),
            );
          },
          child: const Text(
            'View History',
            style: TextStyle(
              color: CupertinoColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        border: null,
        backgroundColor: CupertinoTheme.of(context).primaryColor,
      ),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CupertinoButton.filled(
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    onPressed: () {},
                    child: const Text(
                      'Start Timer',
                      style: TextStyle(
                        color: CupertinoColors.white,
                      ),
                    ),
                  ),
                  CupertinoButton.filled(
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: const Text(
                      'End Timer',
                      style: TextStyle(
                        color: CupertinoColors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16.0),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const ExercisePickerWidget(),
                    const SizedBox(height: 16.0),
                    const Row(
                      children: [
                        Expanded(
                          child: CupertinoTextField(
                            placeholder: 'Reps',
                            padding: EdgeInsets.all(12.0),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: CupertinoTextField(
                            placeholder: 'Sets',
                            padding: EdgeInsets.all(12.0),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    const CupertinoTextField(
                      placeholder: 'Weight',
                      padding: EdgeInsets.all(12.0),
                    ),
                    const SizedBox(height: 16.0),
                    const Row(
                      children: [
                        Expanded(
                          child: CupertinoTextField(
                            placeholder: 'Distance',
                            padding: EdgeInsets.all(12.0),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: CupertinoTextField(
                            placeholder: 'Duration',
                            padding: EdgeInsets.all(12.0),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CupertinoColors.systemBackground
                              .resolveFrom(context),
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                        color: CupertinoColors.systemBackground
                            .resolveFrom(context),
                        boxShadow: [
                          BoxShadow(
                            color: CupertinoTheme.of(context).primaryColor,
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16.0),
                      height: 150,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircularProgressBar(
                            progress: 180.0,
                            goal: 500.0,
                            semanticsLabel: 'Calories Burned',
                          ),
                          Text(
                            '567 Calories Burned',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CupertinoButton.filled(
                          onPressed: () {},
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              color: CupertinoColors.white,
                            ),
                          ),
                        ),
                        CupertinoButton.filled(
                          onPressed: () {},
                          child: const Text(
                            'Save & New',
                            style: TextStyle(
                              color: CupertinoColors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: CupertinoColors.systemGrey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Text(
                    'Weekly Progress Graph',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
