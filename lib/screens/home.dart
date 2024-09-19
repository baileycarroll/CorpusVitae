// Importing Required Packages and Modules
// Importing Database Helper
// Individual Forms
import 'package:corpus_vitae/screens/home/workout.dart';
import 'package:corpus_vitae/utils/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  // Setting Initial State Variables
  bool _addWorkout = false;
  bool _addWorkoutExercises = false;
  bool _addMeal = false;
  bool _addMealItems = false;
  bool _addGoal = false;
  bool _error = false;
  String _user = '';
  List _exercises = [];
  List _exerciseTypes = [];
  final DateTime _date = DateTime.now();
  String _errorMsg = '';
  // Workout Management Controllers
  late int _workout_id;
  //----------------------------------------------------------------------------------------------------
  // Workout Controllers
  final TextEditingController _workoutNameController = TextEditingController();
  final TextEditingController _workoutDateController = TextEditingController();
  final TextEditingController _workoutStartTimeController =
      TextEditingController();
  final TextEditingController _workoutEndTimeController =
      TextEditingController();
  final TextEditingController _workoutDurationController =
      TextEditingController();
  final TextEditingController _workoutDistanceController =
      TextEditingController();
  final TextEditingController _workoutCaloriesBurnedController =
      TextEditingController();
  final TextEditingController _workoutNotesController = TextEditingController();
  // Workout Exercise Controllers
  final TextEditingController _workoutExerciseWorkoutIDController =
      TextEditingController();
  final TextEditingController _workoutExerciseExerciseIDController =
      TextEditingController();
  final TextEditingController _workoutExerciseSetsController =
      TextEditingController();
  final TextEditingController _workoutExerciseRepsController =
      TextEditingController();
  final TextEditingController _workoutExerciseWeightController =
      TextEditingController();
  final TextEditingController _workoutExerciseDurationController =
      TextEditingController();
  final TextEditingController _workoutExerciseDistanceController =
      TextEditingController();
  final TextEditingController _workoutExerciseCaloriesBurnedController =
      TextEditingController();
  final TextEditingController _workoutExerciseNotesController =
      TextEditingController();
  //----------------------------------------------------------------------------------------------------
  // Meal Management Controllers
  late final int _meal_id;
  late final int _meal_type_id;
  //----------------------------------------------------------------------------------------------------
  // Meal Controllers
  final TextEditingController _mealTypeIDController = TextEditingController();
  final TextEditingController _mealNameController = TextEditingController();
  final TextEditingController _mealDateController = TextEditingController();
  final TextEditingController _mealTimeController = TextEditingController();
  final TextEditingController _mealCaloriesController = TextEditingController();
  final TextEditingController _mealNotesController = TextEditingController();
  // Meal Types Controllers
  final TextEditingController _mealTypeIdController = TextEditingController();
  final TextEditingController _mealTypeNameController = TextEditingController();
  // Meal Items Controllers
  final TextEditingController _mealIDController = TextEditingController();
  final TextEditingController _mealItemNameController = TextEditingController();
  final TextEditingController _mealItemServingsController =
      TextEditingController();
  final TextEditingController _mealItemCaloriesController =
      TextEditingController();
  final TextEditingController _mealItemWaterOZController =
      TextEditingController();
  final TextEditingController _mealItemNotesController =
      TextEditingController();
  //----------------------------------------------------------------------------------------------------
  // Goal Management Controllers
  late final int _goal_id;
  late final int _goal_type_id;
  //----------------------------------------------------------------------------------------------------
  // Goal Controllers
  final TextEditingController _goalTypeIDController = TextEditingController();
  final TextEditingController _goalExerciseIDController =
      TextEditingController();
  final TextEditingController _goalNameController = TextEditingController();
  final TextEditingController _goalStartDateController =
      TextEditingController();
  final TextEditingController _goalEndDateController = TextEditingController();
  final TextEditingController _goalWeightController = TextEditingController();
  final TextEditingController _goalCaloriesController = TextEditingController();
  final TextEditingController _goalDurationController = TextEditingController();
  final TextEditingController _goalDistanceController = TextEditingController();
  final TextEditingController _goalMilesController = TextEditingController();
  final TextEditingController _goalMileTimeController = TextEditingController();
  final TextEditingController _goalRepsController = TextEditingController();
  final TextEditingController _goalSetsController = TextEditingController();
  final TextEditingController _goalCurrentValueController =
      TextEditingController();
  final TextEditingController _goalCaloriesBurnedController =
      TextEditingController();
  final TextEditingController _goalNotesController = TextEditingController();
  // Goal Types Controllers
  final TextEditingController _goalTypeNameController = TextEditingController();
  //----------------------------------------------------------------------------------------------------

  // Import DBHelper Function(s)
  final DatabaseHelper dbHelper = DatabaseHelper();
  // Get Initial Data for All Forms as Needed
  Future<void> _getInitialData() async {
    final List<Map<String, dynamic>> exercises = await dbHelper.getExercises();
    _exercises = exercises;
    final List<Map<String, dynamic>> exerciseTypes =
        await dbHelper.getExerciseTypes();
    _exerciseTypes = exerciseTypes;
  }

  // Initialize State
  @override
  void initState() {
    super.initState();
    _getInitialData();
    _workout_id = 0;
    _user = 'John Doe';
    _getUser();
  }

  // Get User Profile Name
  Future<void> _getUser() async {
    final profile = await dbHelper.getProfile();
    if (profile != null) {
      setState(() {
        _user = profile['name'];
      });
    }
  }
  //----------------------------------------------------------------------------------------------------

  // Create Workout
  Future<void> _createWorkout() async {
    final Map<String, dynamic> workout = {
      _workout_id != 0 ? 'id' : 'workout_id': _workout_id,
      'name': _workoutNameController.text,
      'date': _workoutDateController.text,
      'start_time': _workoutStartTimeController.text,
      'end_time': _workoutEndTimeController.text,
      'duration': _workoutDurationController.text,
      'distance': _workoutDistanceController.text,
      'calories': _workoutCaloriesBurnedController.text,
      'notes': _workoutNotesController.text,
    };
    if (_workout_id == 0) {
      // Handle Success
      _addWorkout = false;
      _addWorkoutExercises = true;
      _workout_id = await dbHelper.createWorkout(workout);
    } else {
      // Handle Error
      await dbHelper.updateWorkout(workout);
      _addWorkout = false;
    }
  }

  // Add Exercises to Workout
  Future<void> _addWorkoutExercise() async {
    final Map<String, dynamic> workoutExercise = {
      'workout_id': _workoutExerciseWorkoutIDController.text,
      'exercise_id': _workoutExerciseExerciseIDController.text,
      'sets': _workoutExerciseSetsController.text,
      'reps': _workoutExerciseRepsController.text,
      'weight': _workoutExerciseWeightController.text,
      'duration': _workoutExerciseDurationController.text,
      'distance': _workoutExerciseDistanceController.text,
      'calories': _workoutExerciseCaloriesBurnedController.text,
      'notes': _workoutExerciseNotesController.text,
    };
    final int workoutExerciseId =
        await dbHelper.addWorkoutExercise(workoutExercise);
    if (workoutExerciseId != 0) {
      // Handle Success
      _addWorkoutExercises = false;
    } else {
      // Handle Error
      _error = true;
      _errorMsg = 'Error Adding Exercise to Workout';
      _addWorkoutExercises = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: _addWorkout
            ? Column(
                children: [
                  BuildWorkoutForm(
                    workoutNameController: _workoutNameController,
                    workoutDateController: _workoutDateController,
                    workoutStartTimeController: _workoutStartTimeController,
                    workoutEndTimeController: _workoutEndTimeController,
                    workoutDurationController: _workoutDurationController,
                    workoutDistanceController: _workoutDistanceController,
                    workoutCaloriesController: _workoutCaloriesBurnedController,
                    workoutNotesController: _workoutNotesController,
                    exercises: _exercises,
                    exerciseTypes: _exerciseTypes,
                  ),
                  Card(
                    shadowColor: CupertinoTheme.of(context).primaryColor,
                    elevation: 10.0,
                    surfaceTintColor: CupertinoTheme.of(context).primaryColor,
                    borderOnForeground: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    child: CupertinoButton(
                      child: const Text('Save Workout'),
                      onPressed: () {
                        _createWorkout();
                        setState(() {
                          _addWorkout = false;
                          _addWorkoutExercises = true;
                        });
                        // _createWorkout();
                      },
                    ),
                  ),
                ],
              )
            : _addWorkoutExercises
                ? Column(
                    children: [
                      Text('Add Workout Exercises'),
                      Card(
                        shadowColor: CupertinoTheme.of(context).primaryColor,
                        elevation: 10.0,
                        surfaceTintColor:
                            CupertinoTheme.of(context).primaryColor,
                        borderOnForeground: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.5),
                        ),
                        child: CupertinoButton(
                          child: const Text('Save Exercise'),
                          onPressed: () {
                            _createWorkout();
                            setState(() {
                              _addWorkoutExercises = false;
                            });
                            // _createWorkout();
                          },
                        ),
                      ),
                    ],
                  )
                : _addMeal
                    ? Text('Add Meal')
                    : _addMealItems
                        ? Text('Add Meal Items')
                        : _addGoal
                            ? Text('Add Goal')
                            : Column(
                                children: [
                                  Column(
                                    children: [
                                      const SizedBox(height: 48),
                                      Card(
                                        shadowColor: CupertinoTheme.of(context)
                                            .primaryColor,
                                        elevation: 10.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: Text('Welcome, $_user'),
                                              titleTextStyle: TextStyle(
                                                color:
                                                    CupertinoTheme.of(context)
                                                        .primaryColor,
                                                fontSize: 24.0,
                                              ),
                                              subtitle: Text('Today is $_date'),
                                              subtitleTextStyle: TextStyle(
                                                color:
                                                    CupertinoTheme.of(context)
                                                        .primaryColor,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Card(
                                          shadowColor:
                                              CupertinoTheme.of(context)
                                                  .primaryColor,
                                          elevation: 10.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(70.0),
                                          ),
                                          child: CupertinoButton(
                                            child: Row(children: [
                                              Column(children: [
                                                Icon(Icons.add,
                                                    color: CupertinoTheme.of(
                                                            context)
                                                        .primaryContrastingColor)
                                              ]),
                                              const SizedBox(width: 8),
                                              Column(children: [
                                                Text('Workout',
                                                    style: TextStyle(
                                                        color: CupertinoTheme
                                                                .of(context)
                                                            .primaryContrastingColor)),
                                              ]),
                                            ]),
                                            onPressed: () {
                                              setState(() {
                                                _addWorkout = true;
                                              });
                                            },
                                          ),
                                        ),
                                        const SizedBox(height: 24),
                                        Card(
                                          shadowColor:
                                              CupertinoTheme.of(context)
                                                  .primaryColor,
                                          elevation: 10.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(70.0),
                                          ),
                                          child: CupertinoButton(
                                            child: Row(children: [
                                              Column(children: [
                                                Icon(Icons.add,
                                                    color: CupertinoTheme.of(
                                                            context)
                                                        .primaryContrastingColor)
                                              ]),
                                              const SizedBox(width: 8),
                                              Column(children: [
                                                Text('Meal',
                                                    style: TextStyle(
                                                        color: CupertinoTheme
                                                                .of(context)
                                                            .primaryContrastingColor)),
                                              ]),
                                            ]),
                                            onPressed: () {
                                              setState(() {
                                                _addMeal = true;
                                              });
                                            },
                                          ),
                                        ),
                                        const SizedBox(height: 24),
                                        Card(
                                          shadowColor:
                                              CupertinoTheme.of(context)
                                                  .primaryColor,
                                          elevation: 10.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(70.0),
                                          ),
                                          child: CupertinoButton(
                                            child: Row(children: [
                                              Column(children: [
                                                Icon(
                                                  Icons.add,
                                                  color: CupertinoTheme.of(
                                                          context)
                                                      .primaryContrastingColor,
                                                )
                                              ]),
                                              const SizedBox(width: 8),
                                              Column(children: [
                                                Text('Goal',
                                                    style: TextStyle(
                                                        color: CupertinoTheme
                                                                .of(context)
                                                            .primaryContrastingColor)),
                                              ]),
                                            ]),
                                            onPressed: () {
                                              setState(() {
                                                _addGoal = true;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
      ),
    );
  }
}
