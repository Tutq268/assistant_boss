import 'package:hanam/data/api/client/base/rest_api_client.dart';
import 'package:hanam/data/api/client/refresh_token_api_client.dart';
import 'package:hanam/data/api/exceptions/remote_exception.dart';
import 'package:hanam/data/api/model/api_refresh_token_data.dart';
import 'package:hanam/data/api/model/base/data_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class RefreshTokenApiService {
  RefreshTokenApiService(this._refreshTokenApiClient);

  final RefreshTokenApiClient _refreshTokenApiClient;

  Future<DataResponse<ApiRefreshTokenData>?> refreshToken(
      String refreshToken) async {
    try {
      final respone = await _refreshTokenApiClient
          .request<ApiRefreshTokenData, DataResponse<ApiRefreshTokenData>>(
        method: RestMethod.post,
        path: '/v1/auth/refresh',
        decoder: (json) =>
            ApiRefreshTokenData.fromJson(json as Map<String, dynamic>),
      );
      return respone;
    } catch (e) {
      if (e is RemoteException &&
          (e.kind == RemoteExceptionKind.serverDefined ||
              e.kind == RemoteExceptionKind.serverUndefined)) {
        throw RemoteException(kind: RemoteExceptionKind.refreshTokenFailed);
      }
      rethrow;
    }
  }
}
