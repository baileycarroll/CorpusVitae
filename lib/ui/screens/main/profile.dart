// Base Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Widgets
import 'package:corpus_vitae/ui/screens/main/settings.dart';
// Date Formatting
import 'package:intl/intl.dart';

class ProfileScreen extends StatelessWidget {
  final CupertinoTabController tabController; // Accept the tab controller
  const ProfileScreen({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          DateFormat('MM/dd/yyyy').format(DateTime.now()).toString(),
        ),
        trailing: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
            child: const Text(
              'Settings',
              style: TextStyle(
                  color: CupertinoColors.white, fontWeight: FontWeight.bold),
            )),
        border: null,
        backgroundColor: CupertinoTheme.of(context).primaryColor,
      ),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 16.0),
              // Avatar / Profile Image
              CircleAvatar(
                radius: 50.0,
                backgroundImage: const AssetImage('assets/images/avatar.jpg'),
                onBackgroundImageError: (_, __) {
                  // Handle image loading error
                },
                child: const Icon(
                  CupertinoIcons.person,
                  size: 50.0,
                  color: CupertinoColors.white,
                ),
              ),
              const SizedBox(height: 16.0),
              // User Email & Profile Name
              const Card(
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(children: [
                        CupertinoTextField(
                          placeholder: 'Email',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 8.0),
                        CupertinoTextField(
                          placeholder: 'Name',
                        ),
                      ]))),
              const SizedBox(height: 8.0),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const CupertinoTextField(
                        placeholder: 'Height',
                        suffix: Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text('in')),
                      ),
                      const SizedBox(height: 8.0),
                      const CupertinoTextField(
                        placeholder: 'Weight',
                        suffix: Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text('lbs')),
                      ),
                      const SizedBox(height: 8.0),
                      const CupertinoTextField(
                        placeholder: 'Age',
                      ),
                      const SizedBox(height: 8.0),
                      const CupertinoTextField(
                        placeholder: 'Sex',
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Expanded(
                            child: CupertinoButton.filled(
                                child: const Text(
                                  'Save',
                                  style:
                                      TextStyle(color: CupertinoColors.white),
                                ),
                                onPressed: () {}),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              const SizedBox(
                width: double.infinity,
                child: Card(
                  // BMI, BMR, TDEE
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Body Mass Index (BMI):'),
                        SizedBox(height: 8.0),
                        Text('Base Metablic Rate (BMR):'),
                        SizedBox(height: 8.0),
                        Text('Total Daily Energy Expenditure (TDEE):'),
                      ],
                    ),
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
