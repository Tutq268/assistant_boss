// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_popup_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppPopupInfo {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, dynamic Function()? onPressed)
        confirmDialog,
    required TResult Function(
            String message, dynamic Function()? onRetryPressed)
        errorWithRetryDialog,
    required TResult Function() requiredLoginDialog,
    required TResult Function(Widget renderData) blankBottomSheet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, dynamic Function()? onPressed)?
        confirmDialog,
    TResult? Function(String message, dynamic Function()? onRetryPressed)?
        errorWithRetryDialog,
    TResult? Function()? requiredLoginDialog,
    TResult? Function(Widget renderData)? blankBottomSheet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, dynamic Function()? onPressed)?
        confirmDialog,
    TResult Function(String message, dynamic Function()? onRetryPressed)?
        errorWithRetryDialog,
    TResult Function()? requiredLoginDialog,
    TResult Function(Widget renderData)? blankBottomSheet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConfirmDialog value) confirmDialog,
    required TResult Function(_ErrorWithRetryDialog value) errorWithRetryDialog,
    required TResult Function(_RequiredLoginDialog value) requiredLoginDialog,
    required TResult Function(_BlankBottomSheet value) blankBottomSheet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConfirmDialog value)? confirmDialog,
    TResult? Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult? Function(_RequiredLoginDialog value)? requiredLoginDialog,
    TResult? Function(_BlankBottomSheet value)? blankBottomSheet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConfirmDialog value)? confirmDialog,
    TResult Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult Function(_RequiredLoginDialog value)? requiredLoginDialog,
    TResult Function(_BlankBottomSheet value)? blankBottomSheet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppPopupInfoCopyWith<$Res> {
  factory $AppPopupInfoCopyWith(
          AppPopupInfo value, $Res Function(AppPopupInfo) then) =
      _$AppPopupInfoCopyWithImpl<$Res, AppPopupInfo>;
}

/// @nodoc
class _$AppPopupInfoCopyWithImpl<$Res, $Val extends AppPopupInfo>
    implements $AppPopupInfoCopyWith<$Res> {
  _$AppPopupInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppPopupInfo
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ConfirmDialogImplCopyWith<$Res> {
  factory _$$ConfirmDialogImplCopyWith(
          _$ConfirmDialogImpl value, $Res Function(_$ConfirmDialogImpl) then) =
      __$$ConfirmDialogImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, dynamic Function()? onPressed});
}

/// @nodoc
class __$$ConfirmDialogImplCopyWithImpl<$Res>
    extends _$AppPopupInfoCopyWithImpl<$Res, _$ConfirmDialogImpl>
    implements _$$ConfirmDialogImplCopyWith<$Res> {
  __$$ConfirmDialogImplCopyWithImpl(
      _$ConfirmDialogImpl _value, $Res Function(_$ConfirmDialogImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppPopupInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? onPressed = freezed,
  }) {
    return _then(_$ConfirmDialogImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      onPressed: freezed == onPressed
          ? _value.onPressed
          : onPressed // ignore: cast_nullable_to_non_nullable
              as dynamic Function()?,
    ));
  }
}

/// @nodoc

class _$ConfirmDialogImpl implements _ConfirmDialog {
  const _$ConfirmDialogImpl({this.message = '', this.onPressed});

  @override
  @JsonKey()
  final String message;
  @override
  final dynamic Function()? onPressed;

  @override
  String toString() {
    return 'AppPopupInfo.confirmDialog(message: $message, onPressed: $onPressed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmDialogImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.onPressed, onPressed) ||
                other.onPressed == onPressed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, onPressed);

  /// Create a copy of AppPopupInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmDialogImplCopyWith<_$ConfirmDialogImpl> get copyWith =>
      __$$ConfirmDialogImplCopyWithImpl<_$ConfirmDialogImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, dynamic Function()? onPressed)
        confirmDialog,
    required TResult Function(
            String message, dynamic Function()? onRetryPressed)
        errorWithRetryDialog,
    required TResult Function() requiredLoginDialog,
    required TResult Function(Widget renderData) blankBottomSheet,
  }) {
    return confirmDialog(message, onPressed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, dynamic Function()? onPressed)?
        confirmDialog,
    TResult? Function(String message, dynamic Function()? onRetryPressed)?
        errorWithRetryDialog,
    TResult? Function()? requiredLoginDialog,
    TResult? Function(Widget renderData)? blankBottomSheet,
  }) {
    return confirmDialog?.call(message, onPressed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, dynamic Function()? onPressed)?
        confirmDialog,
    TResult Function(String message, dynamic Function()? onRetryPressed)?
        errorWithRetryDialog,
    TResult Function()? requiredLoginDialog,
    TResult Function(Widget renderData)? blankBottomSheet,
    required TResult orElse(),
  }) {
    if (confirmDialog != null) {
      return confirmDialog(message, onPressed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConfirmDialog value) confirmDialog,
    required TResult Function(_ErrorWithRetryDialog value) errorWithRetryDialog,
    required TResult Function(_RequiredLoginDialog value) requiredLoginDialog,
    required TResult Function(_BlankBottomSheet value) blankBottomSheet,
  }) {
    return confirmDialog(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConfirmDialog value)? confirmDialog,
    TResult? Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult? Function(_RequiredLoginDialog value)? requiredLoginDialog,
    TResult? Function(_BlankBottomSheet value)? blankBottomSheet,
  }) {
    return confirmDialog?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConfirmDialog value)? confirmDialog,
    TResult Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult Function(_RequiredLoginDialog value)? requiredLoginDialog,
    TResult Function(_BlankBottomSheet value)? blankBottomSheet,
    required TResult orElse(),
  }) {
    if (confirmDialog != null) {
      return confirmDialog(this);
    }
    return orElse();
  }
}

abstract class _ConfirmDialog implements AppPopupInfo {
  const factory _ConfirmDialog(
      {final String message,
      final dynamic Function()? onPressed}) = _$ConfirmDialogImpl;

  String get message;
  dynamic Function()? get onPressed;

  /// Create a copy of AppPopupInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmDialogImplCopyWith<_$ConfirmDialogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorWithRetryDialogImplCopyWith<$Res> {
  factory _$$ErrorWithRetryDialogImplCopyWith(_$ErrorWithRetryDialogImpl value,
          $Res Function(_$ErrorWithRetryDialogImpl) then) =
      __$$ErrorWithRetryDialogImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, dynamic Function()? onRetryPressed});
}

/// @nodoc
class __$$ErrorWithRetryDialogImplCopyWithImpl<$Res>
    extends _$AppPopupInfoCopyWithImpl<$Res, _$ErrorWithRetryDialogImpl>
    implements _$$ErrorWithRetryDialogImplCopyWith<$Res> {
  __$$ErrorWithRetryDialogImplCopyWithImpl(_$ErrorWithRetryDialogImpl _value,
      $Res Function(_$ErrorWithRetryDialogImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppPopupInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? onRetryPressed = freezed,
  }) {
    return _then(_$ErrorWithRetryDialogImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      onRetryPressed: freezed == onRetryPressed
          ? _value.onRetryPressed
          : onRetryPressed // ignore: cast_nullable_to_non_nullable
              as dynamic Function()?,
    ));
  }
}

/// @nodoc

class _$ErrorWithRetryDialogImpl implements _ErrorWithRetryDialog {
  const _$ErrorWithRetryDialogImpl({this.message = '', this.onRetryPressed});

  @override
  @JsonKey()
  final String message;
  @override
  final dynamic Function()? onRetryPressed;

  @override
  String toString() {
    return 'AppPopupInfo.errorWithRetryDialog(message: $message, onRetryPressed: $onRetryPressed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorWithRetryDialogImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.onRetryPressed, onRetryPressed) ||
                other.onRetryPressed == onRetryPressed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, onRetryPressed);

  /// Create a copy of AppPopupInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorWithRetryDialogImplCopyWith<_$ErrorWithRetryDialogImpl>
      get copyWith =>
          __$$ErrorWithRetryDialogImplCopyWithImpl<_$ErrorWithRetryDialogImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, dynamic Function()? onPressed)
        confirmDialog,
    required TResult Function(
            String message, dynamic Function()? onRetryPressed)
        errorWithRetryDialog,
    required TResult Function() requiredLoginDialog,
    required TResult Function(Widget renderData) blankBottomSheet,
  }) {
    return errorWithRetryDialog(message, onRetryPressed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, dynamic Function()? onPressed)?
        confirmDialog,
    TResult? Function(String message, dynamic Function()? onRetryPressed)?
        errorWithRetryDialog,
    TResult? Function()? requiredLoginDialog,
    TResult? Function(Widget renderData)? blankBottomSheet,
  }) {
    return errorWithRetryDialog?.call(message, onRetryPressed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, dynamic Function()? onPressed)?
        confirmDialog,
    TResult Function(String message, dynamic Function()? onRetryPressed)?
        errorWithRetryDialog,
    TResult Function()? requiredLoginDialog,
    TResult Function(Widget renderData)? blankBottomSheet,
    required TResult orElse(),
  }) {
    if (errorWithRetryDialog != null) {
      return errorWithRetryDialog(message, onRetryPressed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConfirmDialog value) confirmDialog,
    required TResult Function(_ErrorWithRetryDialog value) errorWithRetryDialog,
    required TResult Function(_RequiredLoginDialog value) requiredLoginDialog,
    required TResult Function(_BlankBottomSheet value) blankBottomSheet,
  }) {
    return errorWithRetryDialog(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConfirmDialog value)? confirmDialog,
    TResult? Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult? Function(_RequiredLoginDialog value)? requiredLoginDialog,
    TResult? Function(_BlankBottomSheet value)? blankBottomSheet,
  }) {
    return errorWithRetryDialog?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConfirmDialog value)? confirmDialog,
    TResult Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult Function(_RequiredLoginDialog value)? requiredLoginDialog,
    TResult Function(_BlankBottomSheet value)? blankBottomSheet,
    required TResult orElse(),
  }) {
    if (errorWithRetryDialog != null) {
      return errorWithRetryDialog(this);
    }
    return orElse();
  }
}

abstract class _ErrorWithRetryDialog implements AppPopupInfo {
  const factory _ErrorWithRetryDialog(
      {final String message,
      final dynamic Function()? onRetryPressed}) = _$ErrorWithRetryDialogImpl;

  String get message;
  dynamic Function()? get onRetryPressed;

  /// Create a copy of AppPopupInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorWithRetryDialogImplCopyWith<_$ErrorWithRetryDialogImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequiredLoginDialogImplCopyWith<$Res> {
  factory _$$RequiredLoginDialogImplCopyWith(_$RequiredLoginDialogImpl value,
          $Res Function(_$RequiredLoginDialogImpl) then) =
      __$$RequiredLoginDialogImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequiredLoginDialogImplCopyWithImpl<$Res>
    extends _$AppPopupInfoCopyWithImpl<$Res, _$RequiredLoginDialogImpl>
    implements _$$RequiredLoginDialogImplCopyWith<$Res> {
  __$$RequiredLoginDialogImplCopyWithImpl(_$RequiredLoginDialogImpl _value,
      $Res Function(_$RequiredLoginDialogImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppPopupInfo
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RequiredLoginDialogImpl implements _RequiredLoginDialog {
  const _$RequiredLoginDialogImpl();

  @override
  String toString() {
    return 'AppPopupInfo.requiredLoginDialog()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequiredLoginDialogImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, dynamic Function()? onPressed)
        confirmDialog,
    required TResult Function(
            String message, dynamic Function()? onRetryPressed)
        errorWithRetryDialog,
    required TResult Function() requiredLoginDialog,
    required TResult Function(Widget renderData) blankBottomSheet,
  }) {
    return requiredLoginDialog();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, dynamic Function()? onPressed)?
        confirmDialog,
    TResult? Function(String message, dynamic Function()? onRetryPressed)?
        errorWithRetryDialog,
    TResult? Function()? requiredLoginDialog,
    TResult? Function(Widget renderData)? blankBottomSheet,
  }) {
    return requiredLoginDialog?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, dynamic Function()? onPressed)?
        confirmDialog,
    TResult Function(String message, dynamic Function()? onRetryPressed)?
        errorWithRetryDialog,
    TResult Function()? requiredLoginDialog,
    TResult Function(Widget renderData)? blankBottomSheet,
    required TResult orElse(),
  }) {
    if (requiredLoginDialog != null) {
      return requiredLoginDialog();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConfirmDialog value) confirmDialog,
    required TResult Function(_ErrorWithRetryDialog value) errorWithRetryDialog,
    required TResult Function(_RequiredLoginDialog value) requiredLoginDialog,
    required TResult Function(_BlankBottomSheet value) blankBottomSheet,
  }) {
    return requiredLoginDialog(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConfirmDialog value)? confirmDialog,
    TResult? Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult? Function(_RequiredLoginDialog value)? requiredLoginDialog,
    TResult? Function(_BlankBottomSheet value)? blankBottomSheet,
  }) {
    return requiredLoginDialog?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConfirmDialog value)? confirmDialog,
    TResult Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult Function(_RequiredLoginDialog value)? requiredLoginDialog,
    TResult Function(_BlankBottomSheet value)? blankBottomSheet,
    required TResult orElse(),
  }) {
    if (requiredLoginDialog != null) {
      return requiredLoginDialog(this);
    }
    return orElse();
  }
}

abstract class _RequiredLoginDialog implements AppPopupInfo {
  const factory _RequiredLoginDialog() = _$RequiredLoginDialogImpl;
}

/// @nodoc
abstract class _$$BlankBottomSheetImplCopyWith<$Res> {
  factory _$$BlankBottomSheetImplCopyWith(_$BlankBottomSheetImpl value,
          $Res Function(_$BlankBottomSheetImpl) then) =
      __$$BlankBottomSheetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Widget renderData});
}

/// @nodoc
class __$$BlankBottomSheetImplCopyWithImpl<$Res>
    extends _$AppPopupInfoCopyWithImpl<$Res, _$BlankBottomSheetImpl>
    implements _$$BlankBottomSheetImplCopyWith<$Res> {
  __$$BlankBottomSheetImplCopyWithImpl(_$BlankBottomSheetImpl _value,
      $Res Function(_$BlankBottomSheetImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppPopupInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? renderData = null,
  }) {
    return _then(_$BlankBottomSheetImpl(
      renderData: null == renderData
          ? _value.renderData
          : renderData // ignore: cast_nullable_to_non_nullable
              as Widget,
    ));
  }
}

/// @nodoc

class _$BlankBottomSheetImpl implements _BlankBottomSheet {
  const _$BlankBottomSheetImpl({required this.renderData});

  @override
  final Widget renderData;

  @override
  String toString() {
    return 'AppPopupInfo.blankBottomSheet(renderData: $renderData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlankBottomSheetImpl &&
            (identical(other.renderData, renderData) ||
                other.renderData == renderData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, renderData);

  /// Create a copy of AppPopupInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlankBottomSheetImplCopyWith<_$BlankBottomSheetImpl> get copyWith =>
      __$$BlankBottomSheetImplCopyWithImpl<_$BlankBottomSheetImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, dynamic Function()? onPressed)
        confirmDialog,
    required TResult Function(
            String message, dynamic Function()? onRetryPressed)
        errorWithRetryDialog,
    required TResult Function() requiredLoginDialog,
    required TResult Function(Widget renderData) blankBottomSheet,
  }) {
    return blankBottomSheet(renderData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, dynamic Function()? onPressed)?
        confirmDialog,
    TResult? Function(String message, dynamic Function()? onRetryPressed)?
        errorWithRetryDialog,
    TResult? Function()? requiredLoginDialog,
    TResult? Function(Widget renderData)? blankBottomSheet,
  }) {
    return blankBottomSheet?.call(renderData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, dynamic Function()? onPressed)?
        confirmDialog,
    TResult Function(String message, dynamic Function()? onRetryPressed)?
        errorWithRetryDialog,
    TResult Function()? requiredLoginDialog,
    TResult Function(Widget renderData)? blankBottomSheet,
    required TResult orElse(),
  }) {
    if (blankBottomSheet != null) {
      return blankBottomSheet(renderData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConfirmDialog value) confirmDialog,
    required TResult Function(_ErrorWithRetryDialog value) errorWithRetryDialog,
    required TResult Function(_RequiredLoginDialog value) requiredLoginDialog,
    required TResult Function(_BlankBottomSheet value) blankBottomSheet,
  }) {
    return blankBottomSheet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConfirmDialog value)? confirmDialog,
    TResult? Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult? Function(_RequiredLoginDialog value)? requiredLoginDialog,
    TResult? Function(_BlankBottomSheet value)? blankBottomSheet,
  }) {
    return blankBottomSheet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConfirmDialog value)? confirmDialog,
    TResult Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult Function(_RequiredLoginDialog value)? requiredLoginDialog,
    TResult Function(_BlankBottomSheet value)? blankBottomSheet,
    required TResult orElse(),
  }) {
    if (blankBottomSheet != null) {
      return blankBottomSheet(this);
    }
    return orElse();
  }
}

abstract class _BlankBottomSheet implements AppPopupInfo {
  const factory _BlankBottomSheet({required final Widget renderData}) =
      _$BlankBottomSheetImpl;

  Widget get renderData;

  /// Create a copy of AppPopupInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlankBottomSheetImplCopyWith<_$BlankBottomSheetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
