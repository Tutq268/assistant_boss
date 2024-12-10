import 'package:hanam/data/api/exceptions/app_exception_wrapper.dart';
import 'package:hanam/ui/cubit/base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_state.freezed.dart';

@freezed
class CommonState extends BaseState with _$CommonState {
  const factory CommonState({
    @Default(false) bool isLoading,
    AppExceptionWrapper? appExceptionWrapper,
  }) = _CommonState;
}
