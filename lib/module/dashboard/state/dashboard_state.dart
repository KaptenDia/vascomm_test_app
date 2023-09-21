import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:study_case_vascomm/model/news/news_model.dart';
part 'dashboard_state.freezed.dart';

@unfreezed
class DashboardState with _$DashboardState {
  factory DashboardState({
    @Default(0) int tapIndex,
    @Default(false) bool loading,
    @Default([]) List<News> news,
    @Default(
      [
        "All Product",
        "Layanan Kesehatan",
        "Alat Kesehatan",
      ],
    )
    List buttonList,
  }) = _DashboardState;
}
