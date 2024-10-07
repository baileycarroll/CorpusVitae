// Base Packages
// Widgets
import 'package:corpus_vitae/ui/widgets/circular_progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  double progress = 180.0;
  double goal = 500.0;

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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Card(
                    shadowColor: CupertinoTheme.of(context).primaryColor,
                    elevation: 8.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(children: <Widget>[
                            CircularProgressBar(
                              progress: progress,
                              goal: goal,
                            ),
                          ]),
                          const SizedBox(width: 24.0),
                          Column(
                            children: [
                              Text(
                                "$progress / $goal Cal. Burned",
                                style: const TextStyle(fontSize: 18.0),
                              ),
                              const SizedBox(height: 16.0),
                              CupertinoButton.filled(
                                onPressed: () {
                                  widget.tabController.index = 1;
                                },
                                child: const Text('Log Workout',
                                    style: TextStyle(
                                        color: CupertinoColors.white)),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
