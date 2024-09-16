import 'package:corpus_vitae/utils/preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/database.dart';
import '../utils/height_picker.dart';
import '../utils/sex_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  bool _isEditing = false;
  bool _comprehensiveBMIToggle = sharedPrefs.comprehensiveBMI;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();

  int _selectedFeet = 5; // Default value
  int _selectedInches = 6;
  int _heightInInches = 66; // Default value

  late String _name;
  late String _email;
  late String _age;
  late String _height;
  late String _weight;
  late String _sex;

  //Import Database
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _name = 'John Doe';
    _email = 'johnd@example.com';
    _age = '24.0';
    _height = '5\' 6"';
    _weight = '176.0';
    _sex = 'Male';
    _loadProfile();
    sharedPrefs.addListener(_updateComprehensiveBMI);
  }

  String convertHeight(double heightInches) {
    int feet = (heightInches / 12).floor();
    int inches = (heightInches % 12).floor();
    return '$feet\' $inches"';
  }

  Future<void> _loadProfile() async {
    final profile = await dbHelper.getProfile();
    if (profile != null) {
      setState(() {
        _name = profile['name'];
        _email = profile['email'];
        _age = profile['age'].toString();
        _height = convertHeight(profile['height']);
        _weight = profile['weight'].toString();
        _sex = profile['sex'];
        _nameController.text = _name;
        _emailController.text = _email;
        _ageController.text = _age;
        _heightController.text = _height;
        _weightController.text = _weight;
        _sexController.text = _sex;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _sexController.dispose();
    sharedPrefs.removeListener(_updateComprehensiveBMI);
    super.dispose();
  }

  void _updateComprehensiveBMI() {
    setState(() {
      _comprehensiveBMIToggle = sharedPrefs.comprehensiveBMI;
    });
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _name = _nameController.text;
        _email = _emailController.text;
        _age = _ageController.text;
        _height = "$_selectedFeet' $_selectedInches\"";
        _heightController.text = _height;
        _heightInInches = _selectedFeet * 12 + _selectedInches;
        _weight = _weightController.text;
        _sex = _sexController.text;
        _isEditing = false;
      });
      final profile = {
        'id': 1,
        'name': _name,
        'email': _email,
        'height': _heightInInches,
        'weight': double.parse(_weight),
        'age': double.parse(_age),
        'sex': _sex,
      };
      await dbHelper.saveProfile(profile);
    }
    final profile = await dbHelper.getProfile();
    final profileInfo = {
      'id': 1,
      'name': _name,
      'email': _email,
      'height': _heightInInches,
      'weight': double.parse(_weight),
      'age': double.parse(_age),
      'sex': _sex,
    };
    if (profile == null) {
      await dbHelper.createProfile(profileInfo);
    }
  }

  void _showHeightPicker(BuildContext context) {
    showHeightPicker(
      context: context,
      onSelectedItemChanged: (int feet, int inches) {
        setState(() {
          _selectedFeet = feet;
          _selectedInches = inches;
        });
      },
      onDone: () {
        setState(() {
          _heightController.text = "$_selectedFeet' $_selectedInches\"";
        });
        Navigator.of(context).pop();
      },
      selectedFeet: _selectedFeet,
      selectedInches: _selectedInches,
    );
  }

  void _showSexPicker(BuildContext context) {
    showSexPicker(
      context: context,
      onSelectedItemChanged: (String sex) {
        setState(() {
          _sexController.text = sex;
        });
      },
      onDone: () {
        Navigator.of(context).pop();
      },
      selectedSex: _sexController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: const CupertinoNavigationBar(
      //   middle: Text('Profile'),
      // ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              _isEditing
                  ? _BuildProfileForm(
                      formKey: _formKey,
                      nameController: _nameController,
                      emailController: _emailController,
                      ageController: _ageController,
                      heightController: _heightController,
                      weightController: _weightController,
                      sexController: _sexController,
                      showHeightPicker: () => _showHeightPicker(context),
                      showSexPicker: () => _showSexPicker(context),
                    )
                  : _BuildProfileDisplay(
                      name: _name,
                      email: _email,
                      age: _age,
                      height: _height,
                      weight: _weight,
                      heightInInches: _heightInInches,
                      sex: _sex,
                      comprehensiveBMIToggle: _comprehensiveBMIToggle,
                    ),
              Card(
                shadowColor: CupertinoTheme.of(context).primaryColor,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70.0),
                ),
                child: CupertinoButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _isEditing ? Icons.save : Icons.edit,
                        color:
                            CupertinoTheme.of(context).primaryContrastingColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _isEditing ? 'Save Profile' : 'Edit Profile',
                        style: TextStyle(
                          color: CupertinoTheme.of(context)
                              .primaryContrastingColor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      if (_isEditing) {
                        _saveProfile();
                      } else {
                        _isEditing = true;
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildProfileForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController ageController;
  final TextEditingController heightController;
  final TextEditingController weightController;
  final TextEditingController sexController;
  final VoidCallback showHeightPicker;
  final VoidCallback showSexPicker;

  const _BuildProfileForm({
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.ageController,
    required this.heightController,
    required this.weightController,
    required this.sexController,
    required this.showHeightPicker,
    required this.showSexPicker,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Card(
            shadowColor: CupertinoTheme.of(context).primaryColor,
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('Name: ', style: TextStyle(fontSize: 18)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CupertinoTextField(
                      controller: nameController,
                      placeholder: 'Name',
                      placeholderStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                      scribbleEnabled: false,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CupertinoTheme.of(context).primaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            shadowColor: CupertinoTheme.of(context).primaryColor,
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('Email: ', style: TextStyle(fontSize: 18)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CupertinoTextField(
                      controller: emailController,
                      placeholder: 'Email',
                      placeholderStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      scribbleEnabled: false,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CupertinoTheme.of(context).primaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            shadowColor: CupertinoTheme.of(context).primaryColor,
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('Age: ', style: TextStyle(fontSize: 18)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CupertinoTextField(
                      controller: ageController,
                      placeholder: 'Age',
                      suffix: const Padding(
                          padding: EdgeInsets.all(8.0), child: Text('years')),
                      suffixMode: OverlayVisibilityMode.always,
                      placeholderStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      scribbleEnabled: false,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CupertinoTheme.of(context).primaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            shadowColor: CupertinoTheme.of(context).primaryColor,
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('Height: ', style: TextStyle(fontSize: 18)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: showHeightPicker,
                      child: AbsorbPointer(
                          child: _buildTextField(
                        context: context,
                        controller: heightController,
                        placeholder: 'Height',
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            shadowColor: CupertinoTheme.of(context).primaryColor,
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('Weight: ', style: TextStyle(fontSize: 18)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CupertinoTextField(
                      controller: weightController,
                      placeholder: 'Weight',
                      suffix: const Padding(
                          padding: EdgeInsets.all(8.0), child: Text('lbs')),
                      placeholderStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      scribbleEnabled: false,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CupertinoTheme.of(context).primaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            shadowColor: CupertinoTheme.of(context).primaryColor,
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('Sex: ', style: TextStyle(fontSize: 18)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                        onTap: showSexPicker,
                        child: AbsorbPointer(
                          child: CupertinoTextField(
                            controller: sexController,
                            placeholder: 'Sex',
                            placeholderStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                            scribbleEnabled: false,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: CupertinoTheme.of(context).primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Side By Side Height Picker shows after button is pressed
        ],
      ),
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    required TextEditingController controller,
    required String placeholder,
  }) {
    return Card(
      shadowColor: CupertinoTheme.of(context).primaryColor,
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: CupertinoTextField(
        controller: controller,
        placeholder: placeholder,
        placeholderStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
        style: const TextStyle(
          fontSize: 18,
        ),
        scribbleEnabled: false,
        decoration: BoxDecoration(
          border: Border.all(
            color: CupertinoTheme.of(context).primaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class _BuildProfileDisplay extends StatelessWidget {
  final String name;
  final String email;
  final String age;
  final String height;
  final int heightInInches;
  final String weight;
  final String sex;
  final bool comprehensiveBMIToggle;

  const _BuildProfileDisplay({
    required this.name,
    required this.email,
    required this.age,
    required this.height,
    required this.heightInInches,
    required this.weight,
    required this.sex,
    required this.comprehensiveBMIToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Center(
                child: Icon(Icons.account_circle_sharp,
                    color: CupertinoTheme.of(context).primaryContrastingColor,
                    size: 96),
              ),
              const SizedBox(height: 24),
              Card(
                shadowColor: CupertinoTheme.of(context).primaryColor,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(name,
                            style: TextStyle(
                              color: CupertinoTheme.of(context)
                                  .primaryContrastingColor,
                              fontSize: 18,
                            )),
                        const SizedBox(width: 8),
                        Text(email,
                            style: TextStyle(
                              color: CupertinoTheme.of(context)
                                  .primaryContrastingColor,
                              fontSize: 18,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Card(
                  shadowColor: CupertinoTheme.of(context).primaryColor,
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  '${double.parse(age).toStringAsFixed(0)} years',
                                  style: TextStyle(
                                    color: CupertinoTheme.of(context)
                                        .primaryContrastingColor,
                                    fontSize: 18,
                                  )),
                              const SizedBox(width: 16),
                              Text(sex,
                                  style: TextStyle(
                                    color: CupertinoTheme.of(context)
                                        .primaryContrastingColor,
                                    fontSize: 18,
                                  )),
                              const SizedBox(width: 16),
                              Text(height,
                                  style: TextStyle(
                                    color: CupertinoTheme.of(context)
                                        .primaryContrastingColor,
                                    fontSize: 18,
                                  )),
                              const SizedBox(width: 16),
                              Text(
                                  '${double.parse(weight).toStringAsFixed(0)} lbs',
                                  style: TextStyle(
                                    color: CupertinoTheme.of(context)
                                        .primaryContrastingColor,
                                    fontSize: 18,
                                  )),
                            ],
                          )))),
              const SizedBox(height: 16),
              comprehensiveBMIToggle
                  ? Column(children: [
                      Card(
                          shadowColor: CupertinoTheme.of(context).primaryColor,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      'Body Mass Index (BMI): ${(double.parse(weight) / (heightInInches * heightInInches) * 703).toStringAsFixed(0)}',
                                      style: TextStyle(
                                        color: CupertinoTheme.of(context)
                                            .primaryContrastingColor,
                                        fontSize: 18,
                                      ))))),
                      const SizedBox(height: 16),
                      Card(
                          shadowColor: CupertinoTheme.of(context).primaryColor,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    sex == 'Male'
                                        ? 'Base Metabolic Rate (BMR): ${((13.397 * double.parse(weight)) + (4.799 * heightInInches) - (5.677 * double.parse(age)) + 88.362).toStringAsFixed(0)} cal'
                                        : 'Base Metabolic Rate (BMR): ${((9.247 * double.parse(weight)) + (3.098 * heightInInches) - (4.330 * double.parse(age)) + 447.593).toStringAsFixed(0)} cal',
                                    style: TextStyle(
                                      color: CupertinoTheme.of(context)
                                          .primaryContrastingColor,
                                      fontSize: 18,
                                    ),
                                  )))),
                      const SizedBox(height: 16),
                      Card(
                          shadowColor: CupertinoTheme.of(context).primaryColor,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              sex == 'Male'
                                  ? 'Total Daily Energy Expenditure (TDEE) : ${((10 * double.parse(weight)) + (6.25 * heightInInches) - (5 * double.parse(age)) + 5).toStringAsFixed(0)} cal'
                                  : 'Total Daily Energy Expenditure (TDEE) : ${((10 * double.parse(weight)) + (6.25 * heightInInches) - (5 * double.parse(age)) - 161).toStringAsFixed(0)} cal',
                              style: TextStyle(
                                color: CupertinoTheme.of(context)
                                    .primaryContrastingColor,
                                fontSize: 18,
                              ),
                            ),
                          )))
                    ])
                  : Column(
                      children: [
                        Card(
                          shadowColor: CupertinoTheme.of(context).primaryColor,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'Body Mass Index (BMI): ${(double.parse(weight) / (heightInInches * heightInInches) * 703).toStringAsFixed(0)}',
                                  style: TextStyle(
                                    color: CupertinoTheme.of(context)
                                        .primaryContrastingColor,
                                    fontSize: 18,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
