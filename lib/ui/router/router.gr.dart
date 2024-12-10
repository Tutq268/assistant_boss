// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/cupertino.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:hanam/ui/router/router.dart' as _i3;
import 'package:hanam/ui/screen/chat_bot/detail_chat_page.dart' as _i1;
import 'package:hanam/ui/screen/home/home_page.dart' as _i2;
import 'package:hanam/ui/screen/login/login_page.dart' as _i4;
import 'package:hanam/ui/screen/main/main_page.dart' as _i5;
import 'package:hanam/ui/screen/my_package/my_package_page.dart' as _i6;
import 'package:hanam/ui/screen/points/points_page.dart' as _i7;
import 'package:hanam/ui/screen/service/service_page.dart' as _i8;
import 'package:hanam/ui/screen/splash/splash_page.dart' as _i9;
import 'package:hanam/ui/screen/support/support_page.dart' as _i10;
import 'package:hanam/ui/screen/verify_otp/verify_otp_page.dart' as _i11;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    DetailChatRoute.name: (routeData) {
      final args = routeData.argsAs<DetailChatRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DetailChatPage(
          key: args.key,
          conversationId: args.conversationId,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    HomeTab.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeTabPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MainPage(),
      );
    },
    MyPackageRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MyPackagePage(),
      );
    },
    MyPackageTab.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MyPackageTabPage(),
      );
    },
    PointsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.PointsPage(),
      );
    },
    PointsTab.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PointsTabPage(),
      );
    },
    SelectAppTab.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SelectAppTabPage(),
      );
    },
    SelectTimerTab.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SelectTimerTabPage(),
      );
    },
    ServiceRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ServicePage(),
      );
    },
    ServiceTab.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ServiceTabPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SplashPage(),
      );
    },
    SupportRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SupportPage(),
      );
    },
    SupportTab.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SupportTabPage(),
      );
    },
    VerifyOtpRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyOtpRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.VerifyOtpPage(
          key: args.key,
          isLogin: args.isLogin,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.DetailChatPage]
class DetailChatRoute extends _i12.PageRouteInfo<DetailChatRouteArgs> {
  DetailChatRoute({
    _i13.Key? key,
    required String conversationId,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          DetailChatRoute.name,
          args: DetailChatRouteArgs(
            key: key,
            conversationId: conversationId,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailChatRoute';

  static const _i12.PageInfo<DetailChatRouteArgs> page =
      _i12.PageInfo<DetailChatRouteArgs>(name);
}

class DetailChatRouteArgs {
  const DetailChatRouteArgs({
    this.key,
    required this.conversationId,
  });

  final _i13.Key? key;

  final String conversationId;

  @override
  String toString() {
    return 'DetailChatRouteArgs{key: $key, conversationId: $conversationId}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeTabPage]
class HomeTab extends _i12.PageRouteInfo<void> {
  const HomeTab({List<_i12.PageRouteInfo>? children})
      : super(
          HomeTab.name,
          initialChildren: children,
        );

  static const String name = 'HomeTab';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MainPage]
class MainRoute extends _i12.PageRouteInfo<void> {
  const MainRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MyPackagePage]
class MyPackageRoute extends _i12.PageRouteInfo<void> {
  const MyPackageRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MyPackageRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyPackageRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MyPackageTabPage]
class MyPackageTab extends _i12.PageRouteInfo<void> {
  const MyPackageTab({List<_i12.PageRouteInfo>? children})
      : super(
          MyPackageTab.name,
          initialChildren: children,
        );

  static const String name = 'MyPackageTab';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.PointsPage]
class PointsRoute extends _i12.PageRouteInfo<void> {
  const PointsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          PointsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PointsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PointsTabPage]
class PointsTab extends _i12.PageRouteInfo<void> {
  const PointsTab({List<_i12.PageRouteInfo>? children})
      : super(
          PointsTab.name,
          initialChildren: children,
        );

  static const String name = 'PointsTab';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SelectAppTabPage]
class SelectAppTab extends _i12.PageRouteInfo<void> {
  const SelectAppTab({List<_i12.PageRouteInfo>? children})
      : super(
          SelectAppTab.name,
          initialChildren: children,
        );

  static const String name = 'SelectAppTab';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SelectTimerTabPage]
class SelectTimerTab extends _i12.PageRouteInfo<void> {
  const SelectTimerTab({List<_i12.PageRouteInfo>? children})
      : super(
          SelectTimerTab.name,
          initialChildren: children,
        );

  static const String name = 'SelectTimerTab';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ServicePage]
class ServiceRoute extends _i12.PageRouteInfo<void> {
  const ServiceRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ServiceRoute.name,
          initialChildren: children,
        );

  static const String name = 'ServiceRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ServiceTabPage]
class ServiceTab extends _i12.PageRouteInfo<void> {
  const ServiceTab({List<_i12.PageRouteInfo>? children})
      : super(
          ServiceTab.name,
          initialChildren: children,
        );

  static const String name = 'ServiceTab';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SplashPage]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SupportPage]
class SupportRoute extends _i12.PageRouteInfo<void> {
  const SupportRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SupportRoute.name,
          initialChildren: children,
        );

  static const String name = 'SupportRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SupportTabPage]
class SupportTab extends _i12.PageRouteInfo<void> {
  const SupportTab({List<_i12.PageRouteInfo>? children})
      : super(
          SupportTab.name,
          initialChildren: children,
        );

  static const String name = 'SupportTab';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.VerifyOtpPage]
class VerifyOtpRoute extends _i12.PageRouteInfo<VerifyOtpRouteArgs> {
  VerifyOtpRoute({
    _i14.Key? key,
    required bool isLogin,
    required String phoneNumber,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          VerifyOtpRoute.name,
          args: VerifyOtpRouteArgs(
            key: key,
            isLogin: isLogin,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'VerifyOtpRoute';

  static const _i12.PageInfo<VerifyOtpRouteArgs> page =
      _i12.PageInfo<VerifyOtpRouteArgs>(name);
}

class VerifyOtpRouteArgs {
  const VerifyOtpRouteArgs({
    this.key,
    required this.isLogin,
    required this.phoneNumber,
  });

  final _i14.Key? key;

  final bool isLogin;

  final String phoneNumber;

  @override
  String toString() {
    return 'VerifyOtpRouteArgs{key: $key, isLogin: $isLogin, phoneNumber: $phoneNumber}';
  }
}
