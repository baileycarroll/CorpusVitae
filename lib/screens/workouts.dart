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
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Workout Log')),
      child: 
        SafeArea(
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
                            child: Icon(Icons.add, color: CupertinoTheme.of(context).primaryContrastingColor)
                          ),
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
                        title: Text('Some Workout', style: TextStyle(color: CupertinoTheme.of(context).primaryContrastingColor)),
                        subtitle: Text("09/$index/2024", style: TextStyle(color: CupertinoTheme.of(context).primaryContrastingColor)),
                      ),
                    );
                  }),
                )
              ],
            ),
          )
        )
      );
  }
}