import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_state.freezed.dart';

@unfreezed
class RegisterState with _$RegisterState {
  factory RegisterState({
    @Default(0) int counter,
  }) = _RegisterState;
}
