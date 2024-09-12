import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Corpus Vitae'),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Row(
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
                            Column(
                              children: [
                                Text('Add Workout', style: TextStyle(
                                  color: CupertinoTheme.of(context).primaryContrastingColor)),
                              ]
                            ),
                            const SizedBox(width: 8),
                            Column(
                              children: [
                                Icon(Icons.add, color: CupertinoTheme.of(context).primaryContrastingColor)
                              ]
                            )
                          ]
                        ),
                        onPressed: () {},
                      ),
                    ),
                      Card(
                        shadowColor: CupertinoTheme.of(context).primaryColor,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70.0),
                        ),
                        child: CupertinoButton(
                          child: Row(
                              children: [
                                Column(
                                    children: [
                                      Text('Add Meal',
                                          style: TextStyle(
                                              color: CupertinoTheme.of(context).primaryContrastingColor)),
                                    ]
                                ),
                                const SizedBox(width: 8),
                                Column(
                                    children: [
                                      Icon(Icons.add,
                                      color: CupertinoTheme.of(context).primaryContrastingColor)
                                    ]
                                )
                              ]
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Card(
                        shadowColor: CupertinoTheme.of(context).primaryColor,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70.0),
                        ),
                        child: CupertinoButton(
                          child: Row(
                              children: [
                                Column(
                                    children: [
                                      Text('Add Goal', style: TextStyle(
                                        color: CupertinoTheme.of(context).primaryContrastingColor)),
                                    ]
                                ),
                                const SizedBox(width: 8),
                                Column(
                                    children: [
                                      Icon(Icons.add, color:
                                        CupertinoTheme.of(context).primaryContrastingColor,)
                                    ]
                                )
                              ]
                          ),
                          onPressed: () {},
                        ),
                      ),
                  ]
                  ),
                  const SizedBox(height: 24),
                  Card(
                    shadowColor: CupertinoTheme.of(context).primaryColor,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70.0),
                    ),
                    child: CupertinoButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text('View Most Recent Workout', style: TextStyle(
                                color: CupertinoTheme.of(context).primaryContrastingColor))
                            ]
                          ),
                          const SizedBox(width: 16),
                          Column(
                            children: [
                              Icon(Icons.remove_red_eye, color: CupertinoTheme.of(context).primaryContrastingColor)
                            ]
                          )
                        ]
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 24),
                  Card(
                    shadowColor: CupertinoTheme.of(context).primaryColor,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70.0),
                    ),
                    child: CupertinoButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text('View Most Recent Meal', style: TextStyle(
                                color: CupertinoTheme.of(context).primaryContrastingColor))
                            ]
                          ),
                          const SizedBox(width: 16),
                          Column(
                            children: [
                              Icon(Icons.remove_red_eye, color: CupertinoTheme.of(context).primaryContrastingColor)
                            ]
                          )
                        ]
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}