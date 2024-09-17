import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  GoalsScreenState createState() => GoalsScreenState();
}

class GoalsScreenState extends State<GoalsScreen> {
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
                  leading: index % 2 == 0
                      ? Icon(Icons.fitness_center,
                          color: CupertinoTheme.of(context)
                              .primaryContrastingColor)
                      : Icon(Icons.directions_run,
                          color: CupertinoTheme.of(context)
                              .primaryContrastingColor),
                  title: Text('Goal ${index + 1}',
                      style: TextStyle(
                        color:
                            CupertinoTheme.of(context).primaryContrastingColor,
                        fontSize: 16.0,
                      )),
                  subtitle: Text('Goal Description ${index + 1}',
                      style: TextStyle(
                        color:
                            CupertinoTheme.of(context).primaryContrastingColor,
                        fontSize: 12.0,
                      )),
                  trailing: Icon(Icons.more_vert,
                      color:
                          CupertinoTheme.of(context).primaryContrastingColor),
                  onTap: () => {},
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
                  child: Row(
                    children: [
                      Column(children: [
                        Icon(Icons.remove_red_eye,
                            color: CupertinoTheme.of(context)
                                .primaryContrastingColor)
                      ]),
                      const SizedBox(width: 8),
                      Column(children: [
                        Text('View All Goals',
                            style: TextStyle(
                              color: CupertinoTheme.of(context)
                                  .primaryContrastingColor,
                              fontSize: 16.0,
                            )),
                      ]),
                    ],
                  ),
                  onPressed: () => {},
                ),
              ),
            ],
          ),
        ],
      ),
    )));
  }
}
