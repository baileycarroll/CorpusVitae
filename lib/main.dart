// main.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Screens
import 'package:corpus_vitae/theme.dart' as app_theme;
import 'package:corpus_vitae/ui/screens/home.dart';
import 'package:corpus_vitae/ui/screens/fitness_tracking.dart';
import 'package:corpus_vitae/ui/screens/meal_tracking.dart';

void main() {
  runApp(const CorpusVitaeApp());
}

class CorpusVitaeApp extends StatelessWidget {
  const CorpusVitaeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: app_theme.Theme.lightTheme,
      home: const MainTabScaffold(), // Use the MainTabScaffold as the home
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainTabScaffold extends StatefulWidget {
  const MainTabScaffold({super.key});

  @override
  MainTabScaffoldState createState() => MainTabScaffoldState();
}

class MainTabScaffoldState extends State<MainTabScaffold> {
  late CupertinoTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = CupertinoTabController(); // Initialize the controller
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: _tabController, // Attach the controller to the scaffold
      tabBar: CupertinoTabBar(
        border: null,
        backgroundColor: CupertinoColors.white,
        height: 48.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Fitness',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu), label: 'Nutrition')
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: HomeScreen(tabController: _tabController),
              );
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: FitnessTrackingScreen(tabController: _tabController),
              );
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: MealTrackingScreen(tabController: _tabController),
              );
            });
          default:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: HomeScreen(tabController: _tabController),
              );
            });
        }
      },
    );
  }
}
