import 'package:flutter_bloc/flutter_bloc.dart';
import '../event/register_event.dart';
import '../state/register_state.dart';

mixin _BlocLifecycle {
  void initState() {}
  void dispose() {}
}

class RegisterBloc extends Bloc<RegisterEvent, RegisterState>
    with _BlocLifecycle {
  RegisterBloc() : super(RegisterState()) {
    on<RegisterIncrementEvent>((event, emit) {
      state.counter++;
      emit(state.copyWith());
    });
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
