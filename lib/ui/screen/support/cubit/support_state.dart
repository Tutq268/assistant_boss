import 'package:hanam/ui/cubit/base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'support_state.freezed.dart';

@freezed
class SupportState extends BaseState with _$SupportState {
  const factory SupportState({@Default(false) isLoading}) = SupporteState;
}
