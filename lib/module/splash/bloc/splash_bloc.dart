import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_case_vascomm/core.dart';
import 'package:study_case_vascomm/service/users_service/users_service.dart';

mixin _BlocLifecycle {
  void initState() {}
  void dispose() {}
}

class SplashBloc extends Bloc<SplashEvent, SplashState> with _BlocLifecycle {
  SplashBloc() : super(SplashState()) {
    on<SplashIncrementEvent>((event, emit) {
      state.counter++;
      emit(state.copyWith());
    });
  }

  void navigateToScreen() async {
    final user = await UsersService().getUser();
    if (user != null) {
      Get.to(DashboardView(user: user));
    } else {
      Get.to(const LoginView());
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      // After 3 seconds, navigate to the appropriate screen
      navigateToScreen();
    });
    //initState event
    super.initState();

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
}
