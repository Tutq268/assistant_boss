// class BaseCubit extends Cubit<AppState> {
//   BaseCubit() : super(const AppState());
//   Future<void> initData() async {
//     try {} on DioException catch (e) {}
//   }
// }

import 'dart:async';

import 'package:hanam/data/api/exception_handler/exception_handler.dart';
import 'package:hanam/data/api/exception_handler/exception_message_mapper.dart';
import 'package:hanam/data/api/exceptions/app_exception.dart';
import 'package:hanam/data/api/exceptions/app_exception_wrapper.dart';
import 'package:hanam/data/api/exceptions/remote_exception.dart';
import 'package:hanam/foundation/mixin/log_mixin.dart';
import 'package:hanam/ui/app_cubit.dart';
import 'package:hanam/ui/cubit/base_state.dart';
import 'package:hanam/ui/cubit/common/common_cubit.dart';
import 'package:hanam/ui/navigation/app_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<S extends BaseState> extends BaseCubitDelegate<S>
    with LogMixin {
  BaseCubit(super.initialState);
}

abstract class BaseCubitDelegate<S extends BaseState> extends Cubit<S> {
  BaseCubitDelegate(super.initialState);
  late final AppCubit appCubit;
  late final AppNavigator navigator;
  late final ExceptionHandler exceptionHandler;
  late final ExceptionMessageMapper exceptionMessageMapper;
  late final CommonCubit _commonBloc;
  set commonBloc(CommonCubit commonBloc) {
    _commonBloc = commonBloc;
  }

  CommonCubit get commonBloc =>
      this is CommonCubit ? this as CommonCubit : _commonBloc;
  Future<void> addException(AppExceptionWrapper appExceptionWrapper) async {
    commonBloc.onExceptionEmitted(
      appExceptionWrapper: appExceptionWrapper,
    );

    return appExceptionWrapper.exceptionCompleter?.future;
  }

  bool _forceHandleError(AppException appException) {
    return appException is RemoteException &&
        appException.kind == RemoteExceptionKind.refreshTokenFailed;
  }

  Future<void> runBlocCatching({
    required Future<void> Function() action,
    Future<void> Function()? doOnRetry,
    Future<void> Function(AppException)? doOnError,
    Future<void> Function()? doOnSubscribe,
    Future<void> Function()? doOnSuccessOrError,
    Future<void> Function()? doOnEventCompleted,
    bool handleLoading = true,
    bool handleError = true,
    bool handleRetry = true,
    bool Function(AppException)? forceHandleError,
    String? overrideErrorMessage,
  }) async {
    Completer<void>? recursion;
    try {
      await doOnSubscribe?.call();

      await action.call();

      await doOnSuccessOrError?.call();
    } on AppException catch (e) {
      print("exception");

      await doOnSuccessOrError?.call();
      await doOnError?.call(e);

      if (handleError || (forceHandleError?.call(e) ?? _forceHandleError(e))) {
        await addException(AppExceptionWrapper(
          appException: e,
          doOnRetry: doOnRetry ??
              (handleRetry
                  ? () async {
                      recursion = Completer();
                      await runBlocCatching(
                        action: action,
                        doOnEventCompleted: doOnEventCompleted,
                        doOnSubscribe: doOnSubscribe,
                        doOnSuccessOrError: doOnSuccessOrError,
                        doOnError: doOnError,
                        doOnRetry: doOnRetry,
                        forceHandleError: forceHandleError,
                        handleError: handleError,
                        handleLoading: handleLoading,
                        handleRetry: handleRetry,
                        overrideErrorMessage: overrideErrorMessage,
                      );
                      recursion?.complete();
                    }
                  : null),
          exceptionCompleter: Completer<void>(),
          overrideMessage: overrideErrorMessage,
        ));
      }
    } finally {
      await recursion?.future;
      await doOnEventCompleted?.call();
    }
  }
}
