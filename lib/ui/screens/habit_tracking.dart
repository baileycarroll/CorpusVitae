// Base Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Widgets
import 'package:corpus_vitae/ui/screens/habit_history.dart';
// Date Formatting
import 'package:intl/intl.dart';

class HabitTrackingScreen extends StatelessWidget {
  final CupertinoTabController tabController;

  const HabitTrackingScreen({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          DateFormat('MM/dd/yyyy').format(DateTime.now()).toString(),
        ),
        trailing: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => HabitHistoryScreen(),
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
        backgroundColor: CupertinoTheme.of(context).primaryColor,
        border: null,
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text('Morning Routine'),
                            subtitle: const Text('Brush Teeth'),
                            leading: GestureDetector(
                              onTap: () {},
                              child: CupertinoCheckbox(
                                value: false,
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                          ListTile(
                            title: const Text('Morning Routine'),
                            subtitle: const Text('Drank Water'),
                            leading: GestureDetector(
                              onTap: () {},
                              child: CupertinoCheckbox(
                                value: false,
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                          ListTile(
                            title: const Text('Morning Routine'),
                            subtitle: const Text('Meditation'),
                            leading: GestureDetector(
                              onTap: () {},
                              child: CupertinoCheckbox(
                                value: false,
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CupertinoButton.filled(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 48.0),
                                onPressed: () {},
                                child: const Text(
                                  'Log Sleep',
                                  style: TextStyle(
                                    color: CupertinoColors.white,
                                  ),
                                ),
                              ),
                              CupertinoButton.filled(
                                onPressed: () {},
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 48.0),
                                child: const Text(
                                  'Save Habits',
                                  style: TextStyle(
                                    color: CupertinoColors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text('Mood Tracking'),
                          Slider(
                            value: 5.0,
                            min: 0,
                            max: 10,
                            divisions: 10,
                            label: 5.0.toInt().toString(),
                            onChanged: (double value) {},
                          ),
                          const CupertinoTextField(
                            placeholder: 'Mood Notes',
                            padding: EdgeInsets.all(12.0),
                            minLines: null,
                            maxLines: null,
                            expands: true,
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            children: [
                              Expanded(
                                child: CupertinoButton.filled(
                                  onPressed: () {},
                                  child: const Text(
                                    'Save Mood',
                                    style: TextStyle(
                                      color: CupertinoColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text('Journal'),
                          const CupertinoTextField(
                            placeholder: 'What are your thoughts?',
                            padding: EdgeInsets.all(12.0),
                            minLines: null,
                            maxLines: null,
                            expands: true,
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            children: [
                              Expanded(
                                child: CupertinoButton.filled(
                                  onPressed: () {},
                                  child: const Text(
                                    'Save',
                                    style: TextStyle(
                                      color: CupertinoColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
