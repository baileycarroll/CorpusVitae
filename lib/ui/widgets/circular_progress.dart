import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularProgressBar extends StatelessWidget {
  final double progress; // Example value for calories burned
  final double goal;

  const CircularProgressBar({
    super.key,
    required this.progress,
    required this.goal,
  }); // Example goal for calories to
  // burn

  @override
  Widget build(BuildContext context) {
    double percentage = progress / goal;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 100,
            height: 100,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: percentage,
                  backgroundColor: CupertinoColors.lightBackgroundGray,
                  valueColor: AlwaysStoppedAnimation(
                      CupertinoTheme.of(context).primaryColor),
                  strokeWidth: 10.0,
                ),
                Center(
                  child: Icon(
                    Icons.whatshot,
                    color: CupertinoTheme.of(context).primaryColor,
                    size: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
