import 'package:flutter/cupertino.dart';

void showSexPicker({
  required BuildContext context,
  required Function(String) onSelectedItemChanged,
  required Function() onDone,
  required String selectedSex,
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
                child: CupertinoPicker(
                  itemExtent: 32,
                  onSelectedItemChanged: (index) {
                    onSelectedItemChanged(index == 0 ? 'Male' : 'Female');
                  },
                  scrollController: FixedExtentScrollController(
                    initialItem: selectedSex == 'Male' ? 0 : 1,
                  ),
                  children: const [
                    Center(child: Text('Male')),
                    Center(child: Text('Female')),
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
