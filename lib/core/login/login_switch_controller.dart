import 'package:flutter/foundation.dart';
import 'package:study_case_vascomm/data/user/button_data.dart';
import 'package:study_case_vascomm/model/users/login_switch_model.dart';

import '../../service/users_service/button_service.dart';

class LoginSwitchController {
  LoginSwitchController._();
  static final instance = LoginSwitchController._();

  final config = LoginSwitchModel();
  bool get isDark => config.themeSwitch.value;
  ValueNotifier get themeSwitch => config.themeSwitch;
  final ISwitchButton storage = SwitchButtonServices();

  Future<void> changeTheme(value) async {
    themeSwitch.value = value;
    storage.put('dark', value);
  }
}
