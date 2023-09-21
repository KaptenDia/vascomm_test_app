import 'package:flutter_bloc/flutter_bloc.dart';
import '../event/profile_event.dart';
import '../state/profile_state.dart';

mixin _BlocLifecycle {
  void initState() {}
  void dispose() {}
}

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> with _BlocLifecycle {
  ProfileBloc() : super(ProfileState()) {
    on<ProfileIncrementEvent>((event, emit) {
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
