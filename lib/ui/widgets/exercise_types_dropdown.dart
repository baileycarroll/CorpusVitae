import 'package:flutter/cupertino.dart';

class ExercisePickerWidget extends StatefulWidget {
  const ExercisePickerWidget({super.key});

  @override
  ExercisePickerWidgetState createState() => ExercisePickerWidgetState();
}

class ExercisePickerWidgetState extends State<ExercisePickerWidget> {
  // List of Exercise Types
  final List<String> exerciseTypes = [
    'Cardio',
    'Strength',
    'Flexibility',
    'Balance',
    'Endurance',
  ];

  // Map of exercises
  Map<String, List<String>> exercises = {
    'Cardio': ['Running', 'Cycling', 'Swimming'],
    'Strength': ['Pushups', 'Pullups', 'Squats'],
    'Flexibility': ['Stretching', 'Yoga', 'Pilates'],
    'Balance': ['Tai Chi', 'Pilates', 'Yoga'],
    'Endurance': ['Running', 'Cycling', 'Swimming'],
  };

  // Selected Values
  String selectedExerciseType = 'Cardio';
  String selectedExercise = 'Running';
  String pickerButtonText = 'Select Exercise';

  // Show picker modal
  void _showExercisePicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              height: 250,
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: Column(
                children: [
                  // Exercise Type Picker and Dependent Exercise Picker
                  Row(
                    children: [
                      // Exercise Type Picker
                      Expanded(
                        child: SizedBox(
                          height: 150,
                          child: CupertinoPicker(
                            backgroundColor: CupertinoColors.white,
                            itemExtent: 32.0,
                            scrollController: FixedExtentScrollController(
                              initialItem:
                                  exerciseTypes.indexOf(selectedExerciseType),
                            ),
                            onSelectedItemChanged: (int index) {
                              setModalState(() {
                                // Update the exercise type and reset dependent exercise
                                selectedExerciseType = exerciseTypes[index];
                                selectedExercise =
                                    exercises[selectedExerciseType]![0];
                              });
                            },
                            children: exerciseTypes
                                .map((exercise) => Text(exercise))
                                .toList(),
                          ),
                        ),
                      ),

                      // Dependent Exercise Picker
                      Expanded(
                        child: SizedBox(
                          height: 150,
                          child: CupertinoPicker(
                            key: ValueKey(
                                selectedExerciseType), // Ensure re-build on type change
                            backgroundColor: CupertinoColors.white,
                            itemExtent: 32.0,
                            scrollController: FixedExtentScrollController(
                              initialItem: exercises[selectedExerciseType]!
                                  .indexOf(selectedExercise),
                            ),
                            onSelectedItemChanged: (int index) {
                              setModalState(() {
                                selectedExercise =
                                    exercises[selectedExerciseType]![index];
                              });
                            },
                            children: exercises[selectedExerciseType]!
                                .map((exercise) => Text(exercise))
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  // Done Button
                  CupertinoButton.filled(
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        color: CupertinoColors.white,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        pickerButtonText =
                            '$selectedExerciseType: $selectedExercise';
                      });
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton.filled(
        onPressed: _showExercisePicker,
        child: Text(pickerButtonText,
            style: const TextStyle(color: CupertinoColors.white)),
      ),
    );
  }
}
