import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoadUserEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}
