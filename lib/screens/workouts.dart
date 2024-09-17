import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  WorkoutScreenState createState() => WorkoutScreenState();
}

class WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 64,
                margin: const EdgeInsets.only(right: 16.0),
                child: Card(
                  shadowColor: CupertinoTheme.of(context).primaryColor,
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70.0),
                  ),
                  child: CupertinoButton(
                    child: Center(
                        child: Icon(Icons.add,
                            color: CupertinoTheme.of(context)
                                .primaryContrastingColor)),
                    onPressed: () => {},
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            children: List.generate(6, (index) {
              return Card(
                margin: const EdgeInsets.only(bottom: 16.0),
                shadowColor: CupertinoTheme.of(context).primaryColor,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  // The leading will conditionally change the workout Icon for Weights if non Cardio, Running if Cardio.
                  leading: index % 2 == 0
                      ? Icon(Icons.fitness_center,
                          color: CupertinoTheme.of(context)
                              .primaryContrastingColor)
                      : Icon(Icons.directions_run,
                          color: CupertinoTheme.of(context)
                              .primaryContrastingColor),
                  title: Text(
                      'Some Workout - ${Random().nextInt(600)} Calories Burned',
                      style: TextStyle(
                          color: CupertinoTheme.of(context)
                              .primaryContrastingColor)),
                  subtitle: Text("09/${index + 1}/2024",
                      style: TextStyle(
                          color: CupertinoTheme.of(context)
                              .primaryContrastingColor)),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color:
                          CupertinoTheme.of(context).primaryContrastingColor),
                ),
              );
            }),
          ),
          const SizedBox(height: 24),
          Column(
            children: [
              Card(
                shadowColor: CupertinoTheme.of(context).primaryColor,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70.0),
                ),
                child: CupertinoButton(
                  child: Row(children: [
                    Column(children: [
                      Icon(Icons.remove_red_eye,
                          color: CupertinoTheme.of(context)
                              .primaryContrastingColor)
                    ]),
                    const SizedBox(width: 16),
                    Column(children: [
                      Text('View All Workouts',
                          style: TextStyle(
                              color: CupertinoTheme.of(context)
                                  .primaryContrastingColor)),
                    ]),
                  ]),
                  onPressed: () => {},
                ),
              ),
            ],
          )
        ],
      ),
    )));
  }
}
