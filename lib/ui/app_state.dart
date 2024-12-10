import 'package:hanam/data/model/account/account_model.dart';
import 'package:hanam/ui/cubit/base_state.dart';
import 'package:hanam/ui/enum/language_code/language_code_enum.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState extends BaseState with _$AppState {
  const factory AppState(
      {@Default(false) bool isLoading,
      @Default(LanguageCode.vn) LanguageCode languageCode,
      @Default(false) bool isDarkMode,
      @Default(null) AccountModel? currentUser}) = _AppState;
}
