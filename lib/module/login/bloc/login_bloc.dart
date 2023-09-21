import 'package:flutter_bloc/flutter_bloc.dart';

import '../event/login_event.dart';
import '../state/login_state.dart';

mixin _BlocLifecycle {
  void initState() {}
  void dispose() {}
}

class LoginBloc extends Bloc<LoginEvent, LoginState> with _BlocLifecycle {
  LoginBloc() : super(LoginState()) {
    // on<LoadUserEvent>((event, emit) async {
    //   emit(LoginState(userState: UserLoadingState()));
    //   try {
    //     final users = await UsersService().getUsers();
    //     emit(LoginState(userState: UserLoadedState(users)));
    //   } catch (e) {
    //     emit(LoginState(userState: UserErrorState(e.toString())));
    //   }
    // });
  }

  @override
  void initState() {
    //initState event
    super.initState();
  }

  @override
  void dispose() {
    //dispose event
    super.dispose();
  }

  @override
  Future<void> close() {
    dispose();
    return super.close();
  }
}
