import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildWorkoutForm extends StatelessWidget {
  final TextEditingController workoutNameController;
  final TextEditingController workoutDateController;
  final TextEditingController workoutStartTimeController;
  final TextEditingController workoutEndTimeController;
  final TextEditingController workoutDurationController;
  final TextEditingController workoutDistanceController;
  final TextEditingController workoutCaloriesController;
  final TextEditingController workoutNotesController;
  final List exercises;
  final List exerciseTypes;

  const BuildWorkoutForm({
    super.key,
    required this.workoutNameController,
    required this.workoutDateController,
    required this.workoutStartTimeController,
    required this.workoutEndTimeController,
    required this.workoutDurationController,
    required this.workoutDistanceController,
    required this.workoutCaloriesController,
    required this.workoutNotesController,
    required this.exercises,
    required this.exerciseTypes,
  });

  String dateFormatted(DateTime date) {
    return DateFormat('MM/dd/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    workoutDateController.text = dateFormatted(DateTime.now());
    return Form(
      child: Card(
        margin: const EdgeInsets.all(16.0),
        shadowColor: CupertinoTheme.of(context).primaryColor,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CupertinoTextField(
                controller: workoutNameController,
                placeholder: 'Workout Name',
                placeholderStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CupertinoTheme.of(context).primaryColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(7.5),
                ),
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              CupertinoTextField(
                controller: workoutDateController,
                placeholder: 'Date',
                placeholderStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CupertinoTheme.of(context).primaryColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(7.5),
                ),
                style: const TextStyle(
                  fontSize: 18,
                ),
                prefix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Text('Date')
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    shadowColor: CupertinoTheme.of(context).primaryColor,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    surfaceTintColor: CupertinoTheme.of(context).primaryColor,
                    child: CupertinoButton(
                      child: const Text(
                        'Start Timer',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        workoutStartTimeController.text =
                            DateTime.now().millisecondsSinceEpoch.toString();
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Card(
                    shadowColor: CupertinoTheme.of(context).primaryColor,
                    elevation: 10.0,
                    surfaceTintColor: CupertinoTheme.of(context).primaryColor,
                    borderOnForeground: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    child: CupertinoButton(
                      child: const Text(
                        'End Timer',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        workoutEndTimeController.text =
                            DateTime.now().millisecondsSinceEpoch.toString();
                        workoutDurationController
                            .text = (workoutStartTimeController.text != '' &&
                                workoutEndTimeController.text != '')
                            ? (Duration(
                                      milliseconds: int.parse(
                                              workoutEndTimeController.text) -
                                          int.parse(
                                              workoutStartTimeController.text),
                                    ).inMinutes /
                                    60)
                                .toStringAsFixed(2)
                            : '0';
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              CupertinoTextField(
                controller: workoutDurationController,
                placeholder: 'Duration',
                placeholderStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CupertinoTheme.of(context).primaryColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(7.5),
                ),
                style: const TextStyle(
                  fontSize: 18,
                ),
                prefix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.timer,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Text('Duration')
                    ],
                  ),
                ),
                suffix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Hours'),
                ),
              ),
              const SizedBox(height: 8),
              CupertinoTextField(
                controller: workoutDistanceController,
                placeholder: 'Distance',
                placeholderStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CupertinoTheme.of(context).primaryColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(7.5),
                ),
                style: const TextStyle(
                  fontSize: 18,
                ),
                prefix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.directions_run,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Text('Distance')
                    ],
                  ),
                ),
                suffix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Miles'),
                ),
              ),
              const SizedBox(height: 8),
              CupertinoTextField(
                controller: workoutCaloriesController,
                placeholder: 'Calories Burned',
                placeholderStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CupertinoTheme.of(context).primaryColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(7.5),
                ),
                style: const TextStyle(
                  fontSize: 18,
                ),
                prefix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.local_fire_department,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Text('Calories Burned')
                    ],
                  ),
                ),
                suffix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Calories'),
                ),
              ),
              const SizedBox(height: 8),
              CupertinoTextField(
                controller: workoutNotesController,
                placeholder: 'Notes',
                placeholderStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CupertinoTheme.of(context).primaryColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(7.5),
                ),
                style: const TextStyle(
                  fontSize: 18,
                ),
                maxLines: 10,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
