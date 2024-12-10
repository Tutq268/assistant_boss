import 'package:auto_route/auto_route.dart';
import 'package:hanam/ui/navigation/app_route_info.dart';
import 'package:hanam/ui/navigation/base/base_route_info_mapper.dart';
import 'package:hanam/ui/router/router.gr.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BaseRouteInfoMapper)
class AppRouteInfoMapper extends BaseRouteInfoMapper {
  @override
  PageRouteInfo map(AppRouteInfo appRouteInfo) {
    return appRouteInfo.when(
      login: () => const LoginRoute(),
      main: () => const MainRoute(),
      splash: () => const SplashRoute(),
      verifyOtp: (bool isLogin, String phoneNumber) =>
          VerifyOtpRoute(isLogin: isLogin, phoneNumber: phoneNumber), detailChatPage: (String conversationId) => DetailChatRoute(conversationId: conversationId),
    );
  }
}
