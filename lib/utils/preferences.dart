import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late final SharedPreferences _sharedPrefs;
  final _listeners = <VoidCallback>[];

  static final SharedPrefs _instance = SharedPrefs._internal();

  factory SharedPrefs() => _instance;

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  // Preferences Getters
  bool get theme => _sharedPrefs.getBool('theme') ?? true;
  bool get comprehensiveBMI =>
      _sharedPrefs.getBool('comprehensiveBMI') ?? false;
  // Preferences Setters
  set theme(bool value) {
    _sharedPrefs.setBool('theme', value);
    _notifyListeners();
  }

  set comprehensiveBMI(bool value) {
    _sharedPrefs.setBool('comprehensiveBMI', value);
    _notifyListeners();
  }

  // Listener
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  // Notify Listeners
  void _notifyListeners() {
    for (var listener in _listeners) {
      listener();
    }
  }
}

final sharedPrefs = SharedPrefs();
