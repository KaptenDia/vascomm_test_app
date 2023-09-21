import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_case_vascomm/data/user/button_data.dart';

class SwitchButtonServices extends ISwitchButton {
  @override
  Future delete(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  @override
  Future put(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }
}
