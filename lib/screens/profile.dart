import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:corpus_vitae/utils/preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  bool _comprehensiveBMIToggle = sharedPrefs.comprehensiveBMI;
  @override
  void initState() {
    super.initState();
    sharedPrefs.addListener(_updateComprehensiveBMI);
  }

  @override
  void dispose() {
    sharedPrefs.removeListener(_updateComprehensiveBMI);
    super.dispose();
  }

  void _updateComprehensiveBMI() {
    setState(() {
      _comprehensiveBMIToggle = sharedPrefs.comprehensiveBMI;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Profile'),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      Center(
                        child: Icon(Icons.account_circle_sharp,
                            color: CupertinoTheme.of(context)
                                .primaryContrastingColor,
                            size: 96),
                      ),
                      const SizedBox(height: 24),
                      Card(
                        shadowColor: CupertinoTheme.of(context).primaryColor,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('John Doe',
                                    style: TextStyle(
                                      color: CupertinoTheme.of(context)
                                          .primaryContrastingColor,
                                      fontSize: 24,
                                    )),
                                const SizedBox(width: 8),
                                Text('johnd@example.com',
                                    style: TextStyle(
                                      color: CupertinoTheme.of(context)
                                          .primaryContrastingColor,
                                      fontSize: 24,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Card(
                          shadowColor: CupertinoTheme.of(context).primaryColor,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('${Random().nextInt(40) + 18}',
                                          style: TextStyle(
                                            color: CupertinoTheme.of(context)
                                                .primaryContrastingColor,
                                            fontSize: 24,
                                          )),
                                      const SizedBox(width: 16),
                                      Text('Male',
                                          style: TextStyle(
                                            color: CupertinoTheme.of(context)
                                                .primaryContrastingColor,
                                            fontSize: 24,
                                          )),
                                      const SizedBox(width: 16),
                                      Text('6\'2"',
                                          style: TextStyle(
                                            color: CupertinoTheme.of(context)
                                                .primaryContrastingColor,
                                            fontSize: 24,
                                          )),
                                      const SizedBox(width: 16),
                                      Text('180 lbs',
                                          style: TextStyle(
                                            color: CupertinoTheme.of(context)
                                                .primaryContrastingColor,
                                            fontSize: 24,
                                          )),
                                    ],
                                  )))),
                      const SizedBox(height: 16),
                      Card(
                        shadowColor: CupertinoTheme.of(context).primaryColor,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: _comprehensiveBMIToggle
                                  ? [
                                      Text('BMI: ${Random().nextInt(40) + 18}',
                                          style: TextStyle(
                                            color: CupertinoTheme.of(context)
                                                .primaryContrastingColor,
                                            fontSize: 24,
                                          )),
                                      const SizedBox(width: 16),
                                      Text('BMR: ${Random().nextInt(40) + 18}',
                                          style: TextStyle(
                                            color: CupertinoTheme.of(context)
                                                .primaryContrastingColor,
                                            fontSize: 24,
                                          )),
                                      const SizedBox(width: 16),
                                      Text('TDEE: ${Random().nextInt(40) + 18}',
                                          style: TextStyle(
                                            color: CupertinoTheme.of(context)
                                                .primaryContrastingColor,
                                            fontSize: 24,
                                          )),
                                    ]
                                  : [
                                      Text('BMI: ${Random().nextInt(40) + 18}',
                                          style: TextStyle(
                                            color: CupertinoTheme.of(context)
                                                .primaryContrastingColor,
                                            fontSize: 24,
                                          )),
                                    ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
            // Edit Profile Button
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
                        Icon(Icons.edit,
                            color: CupertinoTheme.of(context)
                                .primaryContrastingColor),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Column(
                      children: [
                        Text('Edit Profile',
                            style: TextStyle(
                              color: CupertinoTheme.of(context)
                                  .primaryContrastingColor,
                              fontSize: 24,
                            )),
                      ],
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
