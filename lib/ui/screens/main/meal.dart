// Base Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Date Formatting
import 'package:intl/intl.dart';
// Widgets
import 'package:corpus_vitae/ui/widgets/circular_progress.dart';
import 'package:corpus_vitae/ui/screens/history/meal.dart';

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
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => MealHistoryScreen(),
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
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16.0,
                  ),
                  const CupertinoTextField(
                      placeholder: 'Search for a meal',
                      prefix: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(
                          CupertinoIcons.search,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                      suffix: Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            CupertinoIcons.barcode,
                            color: CupertinoColors.systemGrey,
                          ))),
                  const SizedBox(height: 16.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Card.outlined(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text('Size'),
                                SizedBox(height: 8.0),
                                CupertinoTextField(
                                  placeholder: 'Calories',
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(height: 8.0),
                                CupertinoTextField(
                                  placeholder: 'Grams',
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(height: 8.0),
                                CupertinoTextField(
                                  placeholder: 'Servings',
                                  keyboardType: TextInputType.number,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Card.outlined(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text('Macros'),
                                SizedBox(height: 8.0),
                                CupertinoTextField(
                                  placeholder: 'Protein',
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(height: 8.0),
                                CupertinoTextField(
                                  placeholder: 'Fats',
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(height: 8.0),
                                CupertinoTextField(
                                  placeholder: 'Carbs',
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(height: 8.0),
                                CupertinoTextField(
                                  placeholder: 'Sugars',
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(height: 8.0),
                                CupertinoTextField(
                                  placeholder: 'Fiber',
                                  keyboardType: TextInputType.number,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
                  const SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CupertinoColors.systemBackground
                            .resolveFrom(context),
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                      color:
                          CupertinoColors.systemBackground.resolveFrom(context),
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
                          progress: 1567.0,
                          goal: 2500.0,
                          semanticsLabel: 'Calories Consumed',
                          icon: Icons.fastfood,
                        ),
                        Text(
                          '1567 Calories Consumed',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
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
            )),
      ),
    );
  }
}
