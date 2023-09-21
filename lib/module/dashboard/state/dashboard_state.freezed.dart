// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DashboardState {
  int get tapIndex => throw _privateConstructorUsedError;
  set tapIndex(int value) => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  set loading(bool value) => throw _privateConstructorUsedError;
  List<News> get news => throw _privateConstructorUsedError;
  set news(List<News> value) => throw _privateConstructorUsedError;
  List<dynamic> get buttonList => throw _privateConstructorUsedError;
  set buttonList(List<dynamic> value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res, DashboardState>;
  @useResult
  $Res call(
      {int tapIndex, bool loading, List<News> news, List<dynamic> buttonList});
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res, $Val extends DashboardState>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tapIndex = null,
    Object? loading = null,
    Object? news = null,
    Object? buttonList = null,
  }) {
    return _then(_value.copyWith(
      tapIndex: null == tapIndex
          ? _value.tapIndex
          : tapIndex // ignore: cast_nullable_to_non_nullable
              as int,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      news: null == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as List<News>,
      buttonList: null == buttonList
          ? _value.buttonList
          : buttonList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DashboardStateCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$_DashboardStateCopyWith(
          _$_DashboardState value, $Res Function(_$_DashboardState) then) =
      __$$_DashboardStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int tapIndex, bool loading, List<News> news, List<dynamic> buttonList});
}

/// @nodoc
class __$$_DashboardStateCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$_DashboardState>
    implements _$$_DashboardStateCopyWith<$Res> {
  __$$_DashboardStateCopyWithImpl(
      _$_DashboardState _value, $Res Function(_$_DashboardState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tapIndex = null,
    Object? loading = null,
    Object? news = null,
    Object? buttonList = null,
  }) {
    return _then(_$_DashboardState(
      tapIndex: null == tapIndex
          ? _value.tapIndex
          : tapIndex // ignore: cast_nullable_to_non_nullable
              as int,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      news: null == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as List<News>,
      buttonList: null == buttonList
          ? _value.buttonList
          : buttonList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$_DashboardState implements _DashboardState {
  _$_DashboardState(
      {this.tapIndex = 0,
      this.loading = false,
      this.news = const [],
      this.buttonList = const [
        "All Product",
        "Layanan Kesehatan",
        "Alat Kesehatan"
      ]});

  @override
  @JsonKey()
  int tapIndex;
  @override
  @JsonKey()
  bool loading;
  @override
  @JsonKey()
  List<News> news;
  @override
  @JsonKey()
  List<dynamic> buttonList;

  @override
  String toString() {
    return 'DashboardState(tapIndex: $tapIndex, loading: $loading, news: $news, buttonList: $buttonList)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DashboardStateCopyWith<_$_DashboardState> get copyWith =>
      __$$_DashboardStateCopyWithImpl<_$_DashboardState>(this, _$identity);
}

abstract class _DashboardState implements DashboardState {
  factory _DashboardState(
      {int tapIndex,
      bool loading,
      List<News> news,
      List<dynamic> buttonList}) = _$_DashboardState;

  @override
  int get tapIndex;
  set tapIndex(int value);
  @override
  bool get loading;
  set loading(bool value);
  @override
  List<News> get news;
  set news(List<News> value);
  @override
  List<dynamic> get buttonList;
  set buttonList(List<dynamic> value);
  @override
  @JsonKey(ignore: true)
  _$$_DashboardStateCopyWith<_$_DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}
