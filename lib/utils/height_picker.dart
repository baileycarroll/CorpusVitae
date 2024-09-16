import 'package:flutter/cupertino.dart';

void showHeightPicker({
  required BuildContext context,
  required Function(int, int) onSelectedItemChanged,
  required Function() onDone,
  required int selectedFeet,
  required int selectedInches,
}) {
  showCupertinoModalPopup(
    context: context,
    builder: (_) => SafeArea(
      child: Container(
        height: 250,
        color: CupertinoTheme.of(context).scaffoldBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CupertinoPicker(
                        itemExtent: 32,
                        onSelectedItemChanged: (index) {
                          onSelectedItemChanged(index + 3, selectedInches);
                        },
                        scrollController: FixedExtentScrollController(
                            initialItem: selectedFeet - 3),
                        children: List<Widget>.generate(5, (int index) {
                          return Center(
                            child: Text("${index + 3}'"),
                          );
                        }),
                      ),
                    ),
                    Expanded(
                      child: CupertinoPicker(
                        itemExtent: 32,
                        onSelectedItemChanged: (index) {
                          onSelectedItemChanged(selectedFeet, index);
                        },
                        scrollController: FixedExtentScrollController(
                            initialItem: selectedInches),
                        children: List<Widget>.generate(12, (int index) {
                          return Center(
                            child: Text("$index\""),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              CupertinoButton(
                onPressed: onDone,
                child: const Text('Done', style: TextStyle(fontSize: 24)),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
