import 'package:corpus_vitae/utils/preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/goals.dart';
import 'screens/home.dart';
import 'screens/nutrition.dart';
import 'screens/profile.dart';
import 'screens/settings.dart';
import 'screens/workouts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefs.init();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    sharedPrefs.addListener(_updateTheme);
  }

  @override
  void dispose() {
    sharedPrefs.removeListener(_updateTheme);
    super.dispose();
  }

  void _updateTheme() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        brightness: SharedPrefs().theme ? Brightness.dark : Brightness.light,
        primaryColor: SharedPrefs().theme
            ? const Color(0xFF22D3EE)
            : const Color(0xFF6200EE),
        primaryContrastingColor: SharedPrefs().theme
            ? const Color(0xFFFFFFFF)
            : const Color(0xFF000000),
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            color: SharedPrefs().theme
                ? const Color(0xFFFFFFFF)
                : const Color(0xFF000000),
            fontSize: 16.0,
          ),
        ),
        barBackgroundColor: SharedPrefs().theme
            ? const Color(0xFF000000)
            : const Color(0xFFFFFFFF),
        scaffoldBackgroundColor: SharedPrefs().theme
            ? const Color(0xFF121212)
            : const Color(0xFFF5F5F5),
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
