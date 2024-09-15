/* Based on the Feature Documentation File in Documentation Folder we want to test for a variety of widgets.
* 1. Test for the AppBar
* 2. Test for the Navigation Bar
* 4. Test for each respective page (Home, Workout Log, Nutrition Log, Goals, Profile, Settings)
* 5. For the Home Page, test for the following:
*   a. Test for the Add Workout Button
*   b. Test for the Add Nutrition Button
*   c. Test for the Add Goal Button
*   d. Test for the View Most Recent Workout Button
*   e. Test for the View Most Recent Meal Button
* 6. For the Workout Log Page, test for the following:
*   a. Test for a list of workouts
*   b. Test for the Add Workout Button
* 7. For the Nutrition Log Page, test for the following:
*   a. Test for a list of meals
*   b. Test for the Add Meal Button
* 8. For the Goals Page, test for the following:
*   a. Test for a list of goals
*   b. Test for the Add Goal Button
* 9. For the Profile Page, test for the following:
*   a. Test for the Name
*   b. Test for the Age
*   c. Test for the Weight
*   d. Test for the Height
*   e. Test for the Sex
*   f. Test for the Comprehensive BMI Values
*     i. Test for the BMI Value
*     ii. Test for the BMR Value
*     iii. Test for the TDEE Value
*   g. Test for the Edit Profile Button
* 10. For the Settings Page, test for the following:
*   a. Test for the Dark Mode Toggle
*   b. Test for the Comprehensive BMI Toggle
*/

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:corpus_vitae/main.dart';

void main() {
  // Test for the App Bar
  testWidgets('Testing for the App Bar', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('Corpus Vitae'), findsOneWidget);
  });
  // Test for the Navigation Bar
  testWidgets('Testing for the Navigation Bar', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.byIcon(CupertinoIcons.home), findsOneWidget);
    expect(find.byIcon(Icons.fitness_center), findsOneWidget);
    expect(find.byIcon(Icons.fastfood), findsOneWidget);
    expect(find.byIcon(Icons.flag_circle), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.person), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.settings), findsOneWidget);
  });
  // Test for the Home Page
  testWidgets('Testing for the Home Page', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.byIcon(Icons.add), findsNWidgets(3));
    expect(find.text('Workout'), findsOneWidget);
    expect(find.text('Meal'), findsOneWidget);
    expect(find.text('Goal'), findsOneWidget);
    expect(find.text('View Most Recent Workout'), findsOneWidget);
    expect(find.text('View Most Recent Meal'), findsOneWidget);
    expect(find.byIcon(Icons.remove_red_eye), findsNWidgets(2));
  });
  // Test for the Workout Log Page
  testWidgets('Testing for the Workout Log Page', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    await tester.tap(find.byIcon(Icons.fitness_center));
    await tester.pump();
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.byIcon(Icons.remove_red_eye), findsOneWidget);
    expect(find.text('View All Workouts'), findsOneWidget);
  });
  // Test for the Nutrition Log Page
  testWidgets('Testing for the Nutrition Log Page', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    await tester.tap(find.byIcon(Icons.fastfood));
    await tester.pump();
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.byIcon(Icons.remove_red_eye), findsOneWidget);
    expect(find.text('View All Meals'), findsOneWidget);
  });
  // Test for the Goals Page
  testWidgets('Testing for the Goals Page', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    await tester.tap(find.byIcon(Icons.flag_circle));
    await tester.pump();
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.byIcon(Icons.remove_red_eye), findsOneWidget);
    expect(find.text('View All Goals'), findsOneWidget);
  });
  // Test for the Profile Page
  testWidgets('Testing for the Profile Page', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    await tester.tap(find.byIcon(Icons.account_circle));
    await tester.pump();
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Age'), findsOneWidget);
    expect(find.text('Weight'), findsOneWidget);
    expect(find.text('Height'), findsOneWidget);
    expect(find.text('Sex'), findsOneWidget);
    expect(find.text('BMI'), findsOneWidget);
    expect(find.text('BMR'), findsOneWidget);
    expect(find.text('TDEE'), findsOneWidget);
    expect(find.text('Edit Profile'), findsOneWidget);
  });
  // Test for the Settings Page
  testWidgets('Testing for the Settings Page', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    await tester.tap(find.byIcon(CupertinoIcons.settings));
    await tester.pump();
    expect(find.byType(Switch), findsNWidgets(2));
    expect(find.text('Dark Mode'), findsOneWidget);
    expect(find.text('Comprehensive BMI'), findsOneWidget);
  });
}
