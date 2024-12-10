import 'dart:async';

import 'package:hanam/data/api/exceptions/app_exception_wrapper.dart';
import 'package:hanam/ui/cubit/base_cubit.dart';
import 'package:hanam/ui/cubit/common/common_state.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CommonCubit extends BaseCubit<CommonState> {
  CommonCubit() : super(const CommonState());
  FutureOr<void> onExceptionEmitted({
    required AppExceptionWrapper appExceptionWrapper,
  }) {
    emit(state.copyWith(appExceptionWrapper: appExceptionWrapper));
  }
}
