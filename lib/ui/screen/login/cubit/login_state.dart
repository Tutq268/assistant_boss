import 'package:hanam/ui/cubit/base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState extends BaseState with _$LoginState {
  const factory LoginState({@Default(false) bool isLoading}) = _LoginState;
}
