import 'dart:io';

import 'package:hanam/data/constant/server/server_request_response_constants.dart';
import 'package:hanam/foundation/helper/app_info/app_info.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'base_interceptor.dart';

@Injectable()
class HeaderInterceptor extends BaseInterceptor {
  HeaderInterceptor(this._appInfo);

  Map<String, dynamic> _headers = {};
  final AppInfo _appInfo;

  @override
  int get priority => BaseInterceptor.headerPriority;

  set headers(Map<String, dynamic> headers) {
    _headers = headers;
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final userAgentValue = userAgentClientHintsHeader();
    options.headers[ServerRequestResponseConstants.userAgentKey] =
        userAgentValue;
    options.headers.addAll(_headers);

    handler.next(options);
  }

  String userAgentClientHintsHeader() {
    return '${Platform.operatingSystem} - ${_appInfo.versionName}(${_appInfo.versionCode})';
  }
}
