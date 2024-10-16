// Base Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Widgets
import 'package:corpus_vitae/ui/widgets/circular_progress.dart';
import 'package:corpus_vitae/ui/widgets/weight_progress_chart.dart';
// Date Formatting
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  // Accept the CupertinoTabController as a parameter
  final CupertinoTabController tabController;

  const HomeScreen({super.key, required this.tabController});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  // You can add state variables here if needed
  double calBurnedProgress = 180.0;
  double calBurnedGoal = 500.0;
  double calEatenProgress = 1300.0;
  double calEatenGoal = 2200.0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Hi, User!',
              style: TextStyle(
                  color: CupertinoColors.white, fontWeight: FontWeight.bold),
            ),
          ),
          trailing: Text(
              DateFormat('MM/dd/yyyy').format(DateTime.now()).toString(),
              style: const TextStyle(
                  color: CupertinoColors.white, fontWeight: FontWeight.bold)),
          border: null,
          backgroundColor: CupertinoTheme.of(context).primaryColor,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Column(children: <Widget>[
                          CircularProgressBar(
                            progress: calBurnedProgress,
                            goal: calBurnedGoal,
                            semanticsLabel: 'Calories Burned',
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            "$calBurnedProgress / $calBurnedGoal",
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const Text('Calories Burned',
                              style: TextStyle(fontSize: 18.0)),
                        ]),
                        const SizedBox(height: 16.0),
                        const CircularProgressBar(
                            progress: 4.0,
                            goal: 7.0,
                            icon: Icons.bed,
                            semanticsLabel: 'Hours Slept'),
                        const SizedBox(height: 8.0),
                        const Text('4 / 7 Hours',
                            style: TextStyle(fontSize: 18.0)),
                        const Text('Sleep Hours',
                            style: TextStyle(fontSize: 18.0)),
                      ],
                    ),
                    Column(
                      children: [
                        CircularProgressBar(
                            progress: calEatenProgress,
                            goal: calEatenGoal,
                            icon: Icons.fastfood,
                            semanticsLabel: 'Calories Eaten'),
                        const SizedBox(height: 8.0),
                        Text(
                          "$calEatenProgress / $calEatenGoal",
                          style: const TextStyle(fontSize: 18.0),
                        ),
                        const Text('Calories Eaten',
                            style: TextStyle(fontSize: 18.0)),
                        const SizedBox(height: 16.0),
                        const CircularProgressBar(
                            progress: 64.0,
                            goal: 100.0,
                            icon: Icons.local_drink,
                            semanticsLabel: 'Water Consumed'),
                        const SizedBox(height: 8.0),
                        const Text('64 / 100 oz',
                            style: TextStyle(fontSize: 18.0)),
                        const Text('Water Intake',
                            style: TextStyle(fontSize: 18.0)),
                      ],
                    ),
                  ],
                ),
                // Weight Chart from weight_progress_chart with example data
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: WeightProgressChart(),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
