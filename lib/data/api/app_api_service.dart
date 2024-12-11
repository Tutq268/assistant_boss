import 'package:dio/dio.dart';
import 'package:hanam/data/api/client/auth_app_server_api_client.dart';
import 'package:hanam/data/api/client/base/rest_api_client.dart';
import 'package:hanam/data/api/client/none_auth_app_server_api_client.dart';
import 'package:hanam/data/api/client/random_user_api_client.dart';
import 'package:hanam/data/api/model/api_auth_response_data.dart';
import 'package:hanam/data/api/model/base/data_response.dart';
import 'package:hanam/data/model/auth/create_user_response.dart';
import 'package:hanam/data/model/auth/verify_otp_response.dart';
import 'package:hanam/data/model/conversation/create_conversation_response.dart';
import 'package:hanam/data/model/conversation/create_message_item_response.dart';
import 'package:hanam/data/model/conversation/upload_file_response.dart';
import 'package:hanam/data/preference/app_preferences.dart';
import 'package:hanam/ui/di/di.dart';
import 'package:hanam/ui/screen/chat_bot/model/message_model.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@LazySingleton()
class AppApiService {
  AppApiService(
    this._noneAuthAppServerApiClient,
    this._authAppServerApiClient,
    this._randomUserApiClient,
  );
  final NoneAuthAppServerApiClient _noneAuthAppServerApiClient;
  final AuthAppServerApiClient _authAppServerApiClient;
  final RandomUserApiClient _randomUserApiClient;

  Future<ApiAuthResponseData?> login({
    required String type,
    required String phone,
  }) async {
    final data = await _noneAuthAppServerApiClient.requestNormal(
      method: RestMethod.post,
      path: '/api/mobile/account/login?hash=gF81ddGY34I',
      body: {
        'type': type,
        'phone': phone,
      },
    );
    if (data == null) return null;
    return ApiAuthResponseData.fromJson(data);
  }

  Future<VerifyOtpResponse?> verifyOtpLogin(
      {required String type,
      required String phone,
      required String verifyCode}) async {
    final data = await _noneAuthAppServerApiClient.requestNormal(
      method: RestMethod.post,
      path: '/api/mobile/account/verify-register?hash=gF81ddGY34I',
      body: {
        'verifyCode': verifyCode,
        'type': type,
        'phone': phone,
      },
    );
    if (data == null) return null;
    return VerifyOtpResponse.fromJson(data);
  }

  Future<CreateUserResponse?> createUser() async {
    var uuid = const Uuid();
    final data = await _noneAuthAppServerApiClient.requestNormal(
      method: RestMethod.post,
      path: '/api/users',
      body: {"name": uuid.v1()},
    );
    if (data == null) return null;
    return CreateUserResponse.fromJson(data);
  }

  Future<CreateConversationResponse?> createConversationId() async {
    var currentUser = getIt.get<AppPreferences>().currentUser;
    if (currentUser == null) {
      return null;
    }
    final userId = currentUser.id;
    final data = await _noneAuthAppServerApiClient.requestNormal(
      method: RestMethod.post,
      path: '/api/conversations',
      body: {"user": userId},
    );
    if (data == null) return null;
    return CreateConversationResponse.fromJson(data);
  }

  Future<GetListConversation?> getListConversation() async {
    var currentUser = getIt.get<AppPreferences>().currentUser;
    if (currentUser == null) {
      return null;
    }
    final userId = currentUser.id;
    final data = await _noneAuthAppServerApiClient.requestNormal(
      method: RestMethod.get,
      path: '/api/conversations?user=$userId',
    );
    if (data == null) return null;
    return GetListConversation.fromJson(data);
  }

  Future<CreateListMessageResponse?> getListMessage(
      {required String conversationId}) async {
    final data = await _noneAuthAppServerApiClient.requestNormal(
      method: RestMethod.get,
      path: '/api/questions?conversation=$conversationId',
    );
    if (data == null) return null;
    return CreateListMessageResponse.fromJson(data);
  }

  Future<CreateMessageItemResponse?> createMessageItem(
      {required String conversationId,
      required String question,
      String? file}) async {
    final data = await _noneAuthAppServerApiClient.requestNormal(
      method: RestMethod.post,
      path: '/api/questions',
      body: file == null
          ? {"question": question, "conversation": conversationId}
          : {
              "question": question,
              "conversation": conversationId,
              "file": file
            },
    );
    if (data == null) return null;
    return CreateMessageItemResponse.fromJson(data);
  }

  Future<UploadFileResponse?> uploadFile({required FormData body}) async {
    final data = await _noneAuthAppServerApiClient.requestNormal(
      method: RestMethod.post,
      path: '/api/files',
      body: body,
    );
    if (data == null) return null;
    return UploadFileResponse.fromJson(data);
  }

  Future<void> logout() async {
    await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: '/v1/auth/logout',
    );
  }

  Future<void> forgotPassword(String email) async {
    await _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: '/v1/auth/forgot-password',
      body: {
        'email': email,
      },
    );
  }

  Future<void> resetPassword({
    required String token,
    required String email,
    required String password,
  }) async {
    await _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: '/v1/auth/reset-password',
      body: {
        'token': token,
        'email': email,
        'password': password,
        'password_confirmation': password,
      },
    );
  }
}
