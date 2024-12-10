// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hanam/data/api/app_api_service.dart' as _i643;
import 'package:hanam/data/api/client/auth_app_server_api_client.dart' as _i94;
import 'package:hanam/data/api/client/none_auth_app_server_api_client.dart'
    as _i402;
import 'package:hanam/data/api/client/random_user_api_client.dart' as _i381;
import 'package:hanam/data/api/client/raw_api_client.dart' as _i308;
import 'package:hanam/data/api/client/refresh_token_api_client.dart' as _i967;
import 'package:hanam/data/api/mapper/base/base_error_response_mapper/firebase_storage_error_response_mapper.dart'
    as _i223;
import 'package:hanam/data/api/mapper/base/base_error_response_mapper/goong_error_response_mapper.dart'
    as _i564;
import 'package:hanam/data/api/mapper/base/base_error_response_mapper/json_array_error_response_mapper.dart'
    as _i910;
import 'package:hanam/data/api/mapper/base/base_error_response_mapper/json_object_error_response_mapper.dart'
    as _i406;
import 'package:hanam/data/api/mapper/base/base_error_response_mapper/line_error_response_mapper.dart'
    as _i780;
import 'package:hanam/data/api/middleware/access_token_interceptor.dart'
    as _i204;
import 'package:hanam/data/api/middleware/connectivity_interceptor.dart'
    as _i871;
import 'package:hanam/data/api/middleware/header_interceptor.dart' as _i301;
import 'package:hanam/data/api/middleware/refresh_token_interceptor.dart'
    as _i548;
import 'package:hanam/data/api/refresh_token_api_service.dart' as _i588;
import 'package:hanam/data/preference/app_preferences.dart' as _i801;
import 'package:hanam/data/preference/language_code_data_mapper.dart' as _i940;
import 'package:hanam/foundation/helper/app_info/app_info.dart' as _i423;
import 'package:hanam/ui/app_cubit.dart' as _i471;
import 'package:hanam/ui/cubit/common/common_cubit.dart' as _i707;
import 'package:hanam/ui/di/di.dart' as _i633;
import 'package:hanam/ui/navigation/app_navigator.dart' as _i612;
import 'package:hanam/ui/navigation/base/base_popup_info_mapper.dart' as _i33;
import 'package:hanam/ui/navigation/base/base_route_info_mapper.dart' as _i892;
import 'package:hanam/ui/navigation/mapper/app_popup_info_mapper.dart' as _i541;
import 'package:hanam/ui/navigation/mapper/app_route_info_mapper.dart' as _i273;
import 'package:hanam/ui/router/app_navigator_impl.dart' as _i715;
import 'package:hanam/ui/router/router.dart' as _i598;
import 'package:hanam/ui/screen/chat_bot/cubit/detail_chat_cubit.dart' as _i437;
import 'package:hanam/ui/screen/home/cubit/home_cubit.dart' as _i851;
import 'package:hanam/ui/screen/login/cubit/login_cubit.dart' as _i280;
import 'package:hanam/ui/screen/main/cubit/main_cubit.dart' as _i741;
import 'package:hanam/ui/screen/my_package/cubit/my_package_cubit.dart'
    as _i968;
import 'package:hanam/ui/screen/points/cubit/points_cubit.dart' as _i355;
import 'package:hanam/ui/screen/service/cubit/service_cubit.dart' as _i689;
import 'package:hanam/ui/screen/splash/cubit/splash_cubit.dart' as _i347;
import 'package:hanam/ui/screen/support/cubit/support_cubit.dart' as _i517;
import 'package:hanam/ui/screen/verify_otp/cubit/verify_otp_cubit.dart'
    as _i297;
import 'package:hanam/ui/share/toast/toast.dart' as _i132;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final serviceModule = _$ServiceModule();
    gh.factory<_i707.CommonCubit>(() => _i707.CommonCubit());
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => serviceModule.prefs,
      preResolve: true,
    );
    gh.factory<_i851.HomeCubit>(() => _i851.HomeCubit());
    gh.factory<_i517.SupportCubit>(() => _i517.SupportCubit());
    gh.factory<_i355.PointsCubit>(() => _i355.PointsCubit());
    gh.factory<_i968.MyPackageCubit>(() => _i968.MyPackageCubit());
    gh.factory<_i689.ServiceCubit>(() => _i689.ServiceCubit());
    gh.factory<_i741.MainCubit>(() => _i741.MainCubit());
    gh.factory<_i940.LanguageCodeDataMapper>(
        () => _i940.LanguageCodeDataMapper());
    gh.factory<_i871.ConnectivityInterceptor>(
        () => _i871.ConnectivityInterceptor());
    gh.factory<_i780.LineErrorResponseMapper>(
        () => _i780.LineErrorResponseMapper());
    gh.factory<_i910.JsonArrayErrorResponseMapper>(
        () => _i910.JsonArrayErrorResponseMapper());
    gh.factory<_i406.JsonObjectErrorResponseMapper>(
        () => _i406.JsonObjectErrorResponseMapper());
    gh.factory<_i564.GoongErrorResponseMapper>(
        () => _i564.GoongErrorResponseMapper());
    gh.factory<_i223.FirebaseStorageErrorResponseMapper>(
        () => _i223.FirebaseStorageErrorResponseMapper());
    gh.lazySingleton<_i598.AppRouter>(() => _i598.AppRouter());
    gh.lazySingleton<_i423.AppInfo>(() => _i423.AppInfo());
    gh.lazySingleton<_i308.RawApiClient>(() => _i308.RawApiClient());
    gh.lazySingleton<_i381.RandomUserApiClient>(
        () => _i381.RandomUserApiClient());
    gh.lazySingleton<_i801.AppPreferences>(
        () => _i801.AppPreferences(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i33.BasePopupInfoMapper>(
        () => _i541.AppPopupInfoMapper());
    gh.factory<_i301.HeaderInterceptor>(
        () => _i301.HeaderInterceptor(gh<_i423.AppInfo>()));
    gh.lazySingleton<_i892.BaseRouteInfoMapper>(
        () => _i273.AppRouteInfoMapper());
    gh.lazySingleton<_i132.IToast>(() => _i132.CustomBotToast());
    gh.lazySingleton<_i471.AppCubit>(() => _i471.AppCubit(
          appPreference: gh<_i801.AppPreferences>(),
          languageCodeDataMapper: gh<_i940.LanguageCodeDataMapper>(),
        ));
    gh.factory<_i204.AccessTokenInterceptor>(
        () => _i204.AccessTokenInterceptor(gh<_i801.AppPreferences>()));
    gh.lazySingleton<_i967.RefreshTokenApiClient>(
        () => _i967.RefreshTokenApiClient(
              gh<_i301.HeaderInterceptor>(),
              gh<_i204.AccessTokenInterceptor>(),
            ));
    gh.lazySingleton<_i402.NoneAuthAppServerApiClient>(
        () => _i402.NoneAuthAppServerApiClient(gh<_i301.HeaderInterceptor>()));
    gh.lazySingleton<_i612.AppNavigator>(() => _i715.AppNavigatorImpl(
          gh<_i598.AppRouter>(),
          gh<_i33.BasePopupInfoMapper>(),
          gh<_i892.BaseRouteInfoMapper>(),
        ));
    gh.lazySingleton<_i588.RefreshTokenApiService>(
        () => _i588.RefreshTokenApiService(gh<_i967.RefreshTokenApiClient>()));
    gh.factory<_i548.RefreshTokenInterceptor>(
        () => _i548.RefreshTokenInterceptor(
              gh<_i801.AppPreferences>(),
              gh<_i588.RefreshTokenApiService>(),
              gh<_i402.NoneAuthAppServerApiClient>(),
            ));
    gh.lazySingleton<_i94.AuthAppServerApiClient>(
        () => _i94.AuthAppServerApiClient(
              gh<_i301.HeaderInterceptor>(),
              gh<_i204.AccessTokenInterceptor>(),
              gh<_i548.RefreshTokenInterceptor>(),
            ));
    gh.lazySingleton<_i643.AppApiService>(() => _i643.AppApiService(
          gh<_i402.NoneAuthAppServerApiClient>(),
          gh<_i94.AuthAppServerApiClient>(),
          gh<_i381.RandomUserApiClient>(),
        ));
    gh.factory<_i297.VerifyOtpCubit>(() => _i297.VerifyOtpCubit(
          apiServices: gh<_i643.AppApiService>(),
          appPrefrence: gh<_i801.AppPreferences>(),
        ));
    gh.factory<_i280.LoginCubit>(
        () => _i280.LoginCubit(apiServices: gh<_i643.AppApiService>()));
    gh.factory<_i437.DetailChatCubit>(
        () => _i437.DetailChatCubit(hanamService: gh<_i643.AppApiService>()));
    gh.factory<_i347.SplashCubit>(() => _i347.SplashCubit(
          appPreference: gh<_i801.AppPreferences>(),
          apiClient: gh<_i643.AppApiService>(),
        ));
    return this;
  }
}

class _$ServiceModule extends _i633.ServiceModule {}
