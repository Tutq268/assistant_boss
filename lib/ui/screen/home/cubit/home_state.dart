import 'package:hanam/ui/cubit/base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState extends BaseState with _$HomeState {
  const factory HomeState({@Default(false) bool isLoading}) = _HomeState;
}
