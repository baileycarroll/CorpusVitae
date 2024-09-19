import 'package:flutter/cupertino.dart';

class ExercisePicker extends StatefulWidget {
  final List exerciseTypes;
  final List exercises;

  const ExercisePicker({
    super.key,
    required this.exerciseTypes,
    required this.exercises,
  });

  @override
  _ExercisePickerState createState() => _ExercisePickerState();
}

class _ExercisePickerState extends State<ExercisePicker> {
  int _selectedExerciseTypeIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Extract names from the objects in the lists
    List<String> exerciseTypeNames =
        widget.exerciseTypes.map((e) => e['name'].toString()).toList();
    List<String> exerciseNames = widget.exercises
        .where((e) =>
            e['exercise_type_id'] ==
            widget.exerciseTypes[_selectedExerciseTypeIndex]['id'])
        .map((e) => e['name'].toString())
        .toList();

    return SafeArea(
      child: Container(
        height: 300,
        color: CupertinoTheme.of(context).scaffoldBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CupertinoPicker(
                        itemExtent: 48,
                        onSelectedItemChanged: (index) {
                          setState(() {
                            _selectedExerciseTypeIndex = index;
                          });
                        },
                        children: exerciseTypeNames.map((exerciseType) {
                          return Center(
                            child: Text(
                              exerciseType,
                              style: TextStyle(
                                color: CupertinoTheme.of(context).primaryColor,
                                fontSize: 18,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Expanded(
                      child: CupertinoPicker(
                        itemExtent: 48,
                        onSelectedItemChanged: (index) {},
                        children: exerciseNames.map((exercise) {
                          return Center(
                            child: Text(
                              exercise,
                              style: TextStyle(
                                color: CupertinoTheme.of(context).primaryColor,
                                fontSize: 18,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CupertinoButton(
            onPressed: onDone,
            child: const Text('Done', style: TextStyle(fontSize: 24)),
          ),
        ),
      ),
    );
  }
}
