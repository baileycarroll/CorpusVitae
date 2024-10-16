import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  // Settings screen with toggles for a variety of things like notifications, dark mode, bmi, expanded bmi, etc.
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Settings'),
        backgroundColor: CupertinoTheme.of(context).primaryColor,
        border: null,
      ),
      child: SafeArea(
        child: Card(
          elevation: 0.0,
          color: CupertinoColors.white,
          child: Column(
            children: [
              const SizedBox(height: 16.0),
              // Notifications
              ListTile(
                title: const Text('Notifications'),
                trailing: CupertinoSwitch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
              const Divider(),
              // Dark Mode
              ListTile(
                title: const Text('Dark Mode'),
                trailing: CupertinoSwitch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
              const Divider(),
              // BMI
              ListTile(
                title: const Text('BMI'),
                trailing: CupertinoSwitch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
              const Divider(),
              // Expanded BMI
              ListTile(
                title: const Text('Expanded BMI'),
                trailing: CupertinoSwitch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text('Meal Tracking'),
                trailing: CupertinoSwitch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text('Fitness Tracking'),
                trailing: CupertinoSwitch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text('Habit Tracking'),
                trailing: CupertinoSwitch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
