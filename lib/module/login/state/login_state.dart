import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:study_case_vascomm/module/login/state/app_states.dart';
part 'login_state.freezed.dart';

@unfreezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(0) int counter,
  }) = _LoginState;
}
