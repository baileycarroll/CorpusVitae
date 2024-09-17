import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NutritionScreen extends StatefulWidget {
  const NutritionScreen({super.key});

  @override
  NutritionScreenState createState() => NutritionScreenState();
}

class NutritionScreenState extends State<NutritionScreen> {
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
                // The leading will conditionally change the Icon for meals and Water Intake.
                leading: index % 2 == 0
                    ? Icon(Icons.fastfood,
                        color:
                            CupertinoTheme.of(context).primaryContrastingColor)
                    : Icon(Icons.local_drink,
                        color:
                            CupertinoTheme.of(context).primaryContrastingColor),
                title: index % 2 == 0
                    ? const Text('Meal')
                    : const Text('Water Intake'),
                subtitle: index % 2 == 0
                    ? Text('Calories: ${Random().nextInt(1000)}')
                    : Text('${Random().nextInt(1000)} oz'),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: CupertinoTheme.of(context).primaryContrastingColor),
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
                        color:
                            CupertinoTheme.of(context).primaryContrastingColor)
                  ]),
                  const SizedBox(width: 16),
                  Column(children: [
                    Text('View All Meals',
                        style: TextStyle(
                            color: CupertinoTheme.of(context)
                                .primaryContrastingColor)),
                  ]),
                ]),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    ))));
  }
}
