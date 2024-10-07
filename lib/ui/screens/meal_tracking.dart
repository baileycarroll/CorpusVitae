// Base Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Date Formatting
import 'package:intl/intl.dart';

class MealTrackingScreen extends StatelessWidget {
  final CupertinoTabController tabController;

  const MealTrackingScreen({super.key, required this.tabController});

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
            // Navigator.of(context).push(
            //   CupertinoPageRoute(
            //     builder: (context) => WorkoutHistoryScreen(),
            //   ),
            // );
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
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Track your meals here!'),
          ],
        ),
      ),
    );
  }
}
