import 'package:hanam/data/api/client/base/dio_builder.dart';
import 'package:hanam/data/api/client/base/rest_api_client.dart';
import 'package:hanam/data/api/middleware/header_interceptor.dart';
import 'package:hanam/data/constant/server/url_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class NoneAuthAppServerApiClient extends RestApiClient {
  NoneAuthAppServerApiClient(HeaderInterceptor headerInterceptor)
      : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(baseUrl: UrlConstants.appApiBaseUrl),
            interceptors: [
              headerInterceptor,
            ],
          ),
        );
}
