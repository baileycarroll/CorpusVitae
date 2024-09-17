import 'package:corpus_vitae/utils/preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  bool _theme = sharedPrefs.theme;
  bool _comprehensiveBMI = sharedPrefs.comprehensiveBMI;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        // this should be a list of settings each in their own card with a switch to toggle them
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                margin:
                    const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                shadowColor: CupertinoTheme.of(context).primaryColor,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  title: const Text('Dark Mode'),
                  trailing: CupertinoSwitch(
                    value: _theme,
                    onChanged: (bool value) {
                      setState(() {
                        _theme = value;
                        sharedPrefs.theme = value;
                      });
                    },
                  ),
                ),
              ),
              Card(
                margin:
                    const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                shadowColor: CupertinoTheme.of(context).primaryColor,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  title: const Text('Comprehensive BMI'),
                  trailing: CupertinoSwitch(
                    value: _comprehensiveBMI,
                    onChanged: (bool value) {
                      setState(() {
                        _comprehensiveBMI = value;
                        sharedPrefs.comprehensiveBMI = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
