import 'package:hanam/ui/cubit/base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

@freezed
class MainState extends BaseState with _$MainState {
  const factory MainState({@Default(false) bool isLoading}) = _MainState;
}
