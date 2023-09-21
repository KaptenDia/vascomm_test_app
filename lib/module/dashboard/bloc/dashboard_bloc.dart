import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_case_vascomm/service/news_service/news_service.dart';
import '../event/dashboard_event.dart';
import '../state/dashboard_state.dart';

mixin _BlocLifecycle {
  void initState() {}
  void dispose() {}
}

class DashboardBloc extends Bloc<DashboardEvent, DashboardState>
    with _BlocLifecycle {
  DashboardBloc() : super(DashboardState()) {
    on<DashboardLoadNews>((event, emit) async {
      add(DashboardLoadingNews());

      var items = await NewsService().getNews();
      state.news = items;

      add(DashboardLoadingCompleteNews());
    });
    on<DashboardLoadingNews>((event, emit) {
      state.loading = true;
      emit(state.copyWith());
    });
    on<DashboardLoadingCompleteNews>((event, emit) {
      state.loading = false;
      emit(state.copyWith());
    });
  }

  @override
  void initState() {
    //initState event
    add(DashboardLoadNews());

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
