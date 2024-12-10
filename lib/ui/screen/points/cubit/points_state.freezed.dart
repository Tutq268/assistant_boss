// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'points_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PointsState {
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of PointsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointsStateCopyWith<PointsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointsStateCopyWith<$Res> {
  factory $PointsStateCopyWith(
          PointsState value, $Res Function(PointsState) then) =
      _$PointsStateCopyWithImpl<$Res, PointsState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$PointsStateCopyWithImpl<$Res, $Val extends PointsState>
    implements $PointsStateCopyWith<$Res> {
  _$PointsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PointsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointsStateImplCopyWith<$Res>
    implements $PointsStateCopyWith<$Res> {
  factory _$$PointsStateImplCopyWith(
          _$PointsStateImpl value, $Res Function(_$PointsStateImpl) then) =
      __$$PointsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$PointsStateImplCopyWithImpl<$Res>
    extends _$PointsStateCopyWithImpl<$Res, _$PointsStateImpl>
    implements _$$PointsStateImplCopyWith<$Res> {
  __$$PointsStateImplCopyWithImpl(
      _$PointsStateImpl _value, $Res Function(_$PointsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PointsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$PointsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PointsStateImpl implements _PointsState {
  const _$PointsStateImpl({this.isLoading = false});

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'PointsState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  /// Create a copy of PointsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointsStateImplCopyWith<_$PointsStateImpl> get copyWith =>
      __$$PointsStateImplCopyWithImpl<_$PointsStateImpl>(this, _$identity);
}

abstract class _PointsState implements PointsState {
  const factory _PointsState({final bool isLoading}) = _$PointsStateImpl;

  @override
  bool get isLoading;

  /// Create a copy of PointsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointsStateImplCopyWith<_$PointsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}