import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      _database = await _initDB();
    }
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE profile(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        height REAL,
        weight REAL,
        age REAL,
        sex TEXT
      );
    ''');
    await db.execute('''
      CREATE TABLE exercise_types(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        exercise_type_id INTEGER,
        name TEXT
      );
    ''');
    await db.execute('''
      INSERT INTO exercise_types(id, exercise_type_id, name) VALUES
      (1, NULL, 'Cardio'),
      (2, NULL, 'Upper Body'),
      (3, 2, 'Chest'),
      (4, 2, 'Back'),
      (5, 2, 'Shoulders'),
      (6, 2, 'Arms'),
      (7, NULL, 'Legs'),
      (8, NULL, 'Core');
      (9, NULL, 'Stretching');
    ''');
    await db.execute('''
      CREATE TABLE exercises(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        exercise_type_id INTEGER,
        name TEXT
      );
    ''');
    await db.execute('''
      INSERT INTO exercises(id, exercise_type_id, name) VALUES
      (1, 1, 'Elliptical'),
      (2, 1, 'Treadmill'),
      (3, 1, 'Stepper'),
      (4, 1, 'Stationary Bike'),
      (5, 1, 'Rowing Machine'),
      (6, 1, 'Free Walk'),
      (7, 1, 'Free Run'),
      (8, 1, 'Free Bike')
      (9, 3, 'Chest Press'),
      (10, 3, 'Incline Press'),
      (11, 3, 'Decline Press'),
      (12, 3, 'Butterflies'),
      (13, 3, 'Dumbbell Flys'),
      (14, 3, 'Cable Cross Overs'),
      (15, 3, 'Push Ups'),
      (16, 5, 'Military Press'),
      (17, 5, 'Arnold Press'),
      (18, 5, 'Lateral Raises'),
      (19, 5, 'Front Raises'),
      (20, 5, 'Rear Delt Flys'),
      (21, 5, 'Shrugs'),
      (22, 5, 'Lateral Pull-Downs'),
      (23, 5, 'Shoulder Press'),
      (24, 4, 'Dead Lift(s)'),
      (25, 4, 'Pull Ups'),
      (26, 4, 'Chin Ups'),
      (27, 4, 'Bent Over Rows'),
      (28, 4, 'Seated Rows'),
      (29, 4, 'Lateral Pull-Downs'),
      (30, 6, 'Bicep Curls'),
      (31, 6, 'Hammer Curls'),
      (32, 6, 'Tricep Extensions'),
      (33, 6, 'Skull Crushers'),
      (34, 6, 'Dips'),
      (35, 6, 'Close Grip Bench Press'),
      (36, 6, 'Cable Bicep Bar'),
      (37, 6, 'Cable Tricep Bar'),
      (38, 7, 'Angled Leg Curls'),
      (39, 7, 'Leg Extensions'),
      (40, 7, 'Seated Leg Press'),
      (41, 7, 'Sled Push'),
      (42, 7, 'Squats'),
      (43, 7, 'Dead Lift(s)'),
      (44, 7, 'Lunges'),
      (45, 7, 'Calf Raises'),
      (46, 8, 'Crunches'),
      (47, 8, 'Hanging Leg Raises'),
      (48, 8, 'Torso Rotation'),
      (49, 8, 'Planks'),
      (50, 8, 'Russian Twists'),
      (51, 8, 'Leg Raises'),
      (52, 8, 'Bicycle Crunches'),
      (53, 8, 'Decline Bench Crunches'),
      (54, 8, 'Mountain Climbers'),
      (55, 8, 'Flutter Kicks'),
      (56, 9, 'Neck Stretch'),
      (57, 9, 'Shoulder Stretch'),
      (58, 9, 'Tricep Stretch'),
      (59, 9, 'Chest Stretch'),
      (60, 9, 'Back Stretch'),
      (61, 9, 'Quad Stretch'),
      (62, 9, 'Hamstring Stretch'),
      (63, 9, 'Calf Stretch'),
      (64, 9, 'Groin Stretch'),
      (65, 9, 'Hip Flexor Stretch'),
      (66, 9, 'IT Band Stretch'),
      (67, 9, 'Piriformis Stretch'),
      (68, 9, 'Glute Stretch'),
      (69, 9, 'Ankle Stretch'),
      (70, 9, 'Wrist Stretch'),
      (71, 9, 'Forearm Stretch'),
      (72, 9, 'Full Body Stretch');
    ''');
    await db.execute('''
      CREATE TABLE workouts(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        date TEXT,
        start_time BIGINT,
        end_time BIGINT,
        duration INTEGER,
        distance REAL,
        calories INTEGER,
        notes TEXT
      );
    ''');
    await db.execute('''
      CREATE TABLE workout_exercises(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        workout_id INTEGER,
        exercise_id INTEGER,
        sets INTEGER,
        reps INTEGER,
        weight REAL,
        duration INTEGER,
        distance REAL,
        calories INTEGER,
        notes TEXT
      );
    ''');
    await db.execute('''
      CREATE TABLE meal_types(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        meal_type_id INTEGER,
        name TEXT
      );
    ''');
    await db.execute('''
      CREATE TABLE meals(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        meal_type_id INTEGER,
        name TEXT,
        date TEXT,
        calories INTEGER,
        notes TEXT
      );
    ''');
    await db.execute('''
      CREATE TABLE meal_items(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        meal_id INTEGER,
        name TEXT,
        servings REAL,
        calories INTEGER,
        water_oz INTEGER,
        notes TEXT
      );
    ''');
    await db.execute('''
      CREATE TABLE goal_types(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        goal_type_id INTEGER,
        name TEXT
      );
    ''');
    await db.execute('''
      CREATE TABLE goals(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        goal_type_id INTEGER,
        exercise_id INTEGER,
        name TEXT,
        start_date TEXT,
        end_date TEXT,
        weight REAL,
        calories REAL,
        duration REAL,
        distance REAL,
        miles REAL,
        mile_time REAL,
        reps REAL,
        sets REAL,
        current REAL,
        calories_burned INTEGER,
        notes TEXT
      );
    ''');
  }

  // Profile
  Future<void> createProfile(Map<String, dynamic> profile) async {
    Database db = await database;
    await db.insert('profile', profile);
  }

  Future<void> saveProfile(Map<String, dynamic> profile) async {
    Database db = await database;
    await db.update('profile', profile, where: 'id = 1');
  }

  Future<Map<String, dynamic>?> getProfile() async {
    Database db = await database;
    List<Map<String, dynamic>> profile =
        await db.query('profile', where: 'id = 1');
    return profile.isNotEmpty ? profile.first : null;
  }

  // Exercise Types
  Future<List<Map<String, dynamic>>> getExerciseTypes() async {
    Database db = await database;
    return await db.query('exercise_types');
  }

  Future<void> createExerciseType(Map<String, dynamic> exerciseType) async {
    Database db = await database;
    List exists = await db.query('exercise_types',
        where: 'name = ?', whereArgs: [exerciseType['name']]);
    if (exists.isEmpty) {
      await db.insert('exercise_types', exerciseType);
    }
  }

  Future<void> updateExerciseType(Map<String, dynamic> exerciseType) async {
    Database db = await database;
    await db.update('exercise_types', exerciseType,
        where: 'id = ?', whereArgs: [exerciseType['id']]);
  }

  // Exercises
  Future<List<Map<String, dynamic>>> getExercises() async {
    Database db = await database;
    return await db.query('exercises');
  }

  Future<void> createExercise(Map<String, dynamic> exercise) async {
    Database db = await database;
    List exists = await db
        .query('exercises', where: 'name = ?', whereArgs: [exercise['name']]);
    if (exists.isEmpty) {
      await db.insert('exercises', exercise);
    }
  }

  Future<void> updateExercise(Map<String, dynamic> exercise) async {
    Database db = await database;
    await db.update('exercises', exercise,
        where: 'id = ?', whereArgs: [exercise['id']]);
  }

  Future<Map<String, dynamic>?> getExercisesByType(int exerciseTypeId) async {
    Database db = await database;
    List<Map<String, dynamic>> exercises = await db.query('exercises',
        where: 'exercise_type_id = ?', whereArgs: [exerciseTypeId]);
    return exercises.isNotEmpty ? exercises.first : null;
  }

  // Workouts
  Future<List<Map<String, dynamic>>> getWorkouts() async {
    Database db = await database;
    return await db.query('workouts');
  }

  Future<void> createWorkout(Map<String, dynamic> workout) async {
    Database db = await database;
    await db.insert('workouts', workout);
  }

  Future<void> updateWorkout(Map<String, dynamic> workout) async {
    Database db = await database;
    await db.update('workouts', workout,
        where: 'id = ?', whereArgs: [workout['id']]);
  }

  Future<Map<String, dynamic>?> getGetWorkoutByID(int exerciseTypeId) async {
    Database db = await database;
    List<Map<String, dynamic>> workouts = await db
        .query('workouts', where: 'id = ?', whereArgs: [exerciseTypeId]);
    return workouts.isNotEmpty ? workouts.first : null;
  }

  // Workout Exercises
  Future<List<Map<String, dynamic>>> getWorkoutExercises() async {
    Database db = await database;
    return await db.query('workout_exercises');
  }

  Future<void> createWorkoutExercise(
      Map<String, dynamic> workoutExercise) async {
    Database db = await database;
    await db.insert('workout_exercises', workoutExercise);
  }

  Future<void> updateWorkoutExercise(
      Map<String, dynamic> workoutExercise) async {
    Database db = await database;
    await db.update('workout_exercises', workoutExercise,
        where: 'id = ?', whereArgs: [workoutExercise['id']]);
  }

  Future<Map<String, dynamic>?> getWorkoutsByWorkoutID(int workoutId) async {
    Database db = await database;
    List<Map<String, dynamic>> workoutExercises = await db.query(
        'workout_exercises',
        where: 'workout_id = ?',
        whereArgs: [workoutId]);
    return workoutExercises.isNotEmpty ? workoutExercises.first : null;
  }

  // Meal Types
  Future<List<Map<String, dynamic>>> getMealTypes() async {
    Database db = await database;
    return await db.query('meal_types');
  }

  Future<void> createMealType(Map<String, dynamic> mealType) async {
    Database db = await database;
    List exists = await db
        .query('meal_types', where: 'name = ?', whereArgs: [mealType['name']]);
    if (exists.isEmpty) {
      await db.insert('meal_types', mealType);
    }
  }

  Future<void> updateMealType(Map<String, dynamic> mealType) async {
    Database db = await database;
    await db.update('meal_types', mealType,
        where: 'id = ?', whereArgs: [mealType['id']]);
  }

  // Meals
  Future<List<Map<String, dynamic>>> getMeals() async {
    Database db = await database;
    return await db.query('meals');
  }

  Future<void> createMeal(Map<String, dynamic> meal) async {
    Database db = await database;
    await db.insert('meals', meal);
  }

  Future<void> updateMeal(Map<String, dynamic> meal) async {
    Database db = await database;
    await db.update('meals', meal, where: 'id = ?', whereArgs: [meal['id']]);
  }

  Future<Map<String, dynamic>?> getMealByID(int mealId) async {
    Database db = await database;
    List<Map<String, dynamic>> meals =
        await db.query('meals', where: 'id = ?', whereArgs: [mealId]);
    return meals.isNotEmpty ? meals.first : null;
  }

  // Meal Items
  Future<List<Map<String, dynamic>>> getMealItems() async {
    Database db = await database;
    return await db.query('meal_items');
  }

  Future<void> createMealItem(Map<String, dynamic> mealItem) async {
    Database db = await database;
    await db.insert('meal_items', mealItem);
  }

  Future<void> updateMealItem(Map<String, dynamic> mealItem) async {
    Database db = await database;
    await db.update('meal_items', mealItem,
        where: 'id = ?', whereArgs: [mealItem['id']]);
  }

  Future<Map<String, dynamic>?> getMealItemsByMealID(int mealId) async {
    Database db = await database;
    List<Map<String, dynamic>> mealItems =
        await db.query('meal_items', where: 'meal_id = ?', whereArgs: [mealId]);
    return mealItems.isNotEmpty ? mealItems.first : null;
  }

  // Goal Types
  Future<List<Map<String, dynamic>>> getGoalTypes() async {
    Database db = await database;
    return await db.query('goal_types');
  }

  Future<void> createGoalType(Map<String, dynamic> goalType) async {
    Database db = await database;
    List exists = await db
        .query('goal_types', where: 'name = ?', whereArgs: [goalType['name']]);
    if (exists.isEmpty) {
      await db.insert('goal_types', goalType);
    }
  }

  Future<void> updateGoalType(Map<String, dynamic> goalType) async {
    Database db = await database;
    await db.update('goal_types', goalType,
        where: 'id = ?', whereArgs: [goalType['id']]);
  }

  // Goals
  Future<List<Map<String, dynamic>>> getGoals() async {
    Database db = await database;
    return await db.query('goals');
  }

  Future<void> createGoal(Map<String, dynamic> goal) async {
    Database db = await database;
    await db.insert('goals', goal);
  }

  Future<void> updateGoal(Map<String, dynamic> goal) async {
    Database db = await database;
    await db.update('goals', goal, where: 'id = ?', whereArgs: [goal['id']]);
  }

  Future<Map<String, dynamic>?> getGoalByID(int goalId) async {
    Database db = await database;
    List<Map<String, dynamic>> goals =
        await db.query('goals', where: 'id = ?', whereArgs: [goalId]);
    return goals.isNotEmpty ? goals.first : null;
  }
}
