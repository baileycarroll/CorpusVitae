import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
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
                    value: true,
                    onChanged: (bool value) {},
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
                    value: true,
                    onChanged: (bool value) {},
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
