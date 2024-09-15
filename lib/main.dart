import 'package:corpus_vitae/utils/preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/workouts.dart';
import 'screens/nutrition.dart';
import 'screens/goals.dart';
import 'screens/profile.dart';
import 'screens/settings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefs.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF22D3EE),
        primaryContrastingColor: Color(0xFFFFFFFF),
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 16.0,
          ),
        ),
        barBackgroundColor: Color(0xFF000000),
        scaffoldBackgroundColor: Color(0xFF000000),
        applyThemeToAll: true,
      ),
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: const [
          BottomNavigationBarItem(
              icon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: EdgeInsets.only(top: 1.0)),
              Icon(CupertinoIcons.home),
              Text('Home')
            ],
          )),
          BottomNavigationBarItem(
              icon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: EdgeInsets.only(top: 1.0)),
              Icon(Icons.fitness_center),
              Text('Workouts')
            ],
          )),
          BottomNavigationBarItem(
              icon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: EdgeInsets.only(top: 1.0)),
              Icon(Icons.fastfood),
              Text('Nutrition')
            ],
          )),
          BottomNavigationBarItem(
              icon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: EdgeInsets.only(top: 1.0)),
              Icon(Icons.flag_circle),
              Text('Goals')
            ],
          )),
          BottomNavigationBarItem(
              icon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: EdgeInsets.only(top: 1.0)),
              Icon(CupertinoIcons.person),
              Text('Profile')
            ],
          )),
          BottomNavigationBarItem(
              icon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: EdgeInsets.only(top: 1.0)),
              Icon(CupertinoIcons.settings),
              Text('Settings')
            ],
          ))
        ]),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return const HomeScreen();
            case 1:
              return const WorkoutScreen();
            case 2:
              return const NutritionScreen();
            case 3:
              return const GoalsScreen();
            case 4:
              return const ProfileScreen();
            case 5:
              return const SettingsScreen();
            default:
              return const HomeScreen();
          }
        },
      ),
    );
  }
}
