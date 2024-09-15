import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late final SharedPreferences _sharedPrefs;

  static final SharedPrefs _instance = SharedPrefs._internal();

  factory SharedPrefs() => _instance;

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }
  // Preferences Getters
  bool get theme => _sharedPrefs.getBool('theme') ?? true;
  bool get comprehensiveBMI => _sharedPrefs.getBool('comprehensiveBMI') ?? false;
  // Preferences Setters
  set theme(bool value) => _sharedPrefs.setBool('theme', value);
  set comprehensiveBMI(bool value) => _sharedPrefs.setBool('comprehensiveBMI', value);
}
final sharedPrefs = SharedPrefs();
