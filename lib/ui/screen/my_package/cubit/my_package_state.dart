import 'package:hanam/ui/cubit/base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_package_state.freezed.dart';

@freezed
class MyPackageState extends BaseState with _$MyPackageState {
  const factory MyPackageState({@Default(false) bool isLoading}) =
      _MyPackageState;
}
