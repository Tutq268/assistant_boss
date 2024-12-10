import 'package:hanam/ui/cubit/base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'points_state.freezed.dart';

@freezed
class PointsState extends BaseState with _$PointsState {
  const factory PointsState({
    @Default(false) bool isLoading,
  }) = _PointsState;
}
