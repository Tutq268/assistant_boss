// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) =>
    CreateUserResponse(
      data: AccountModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateUserResponseToJson(CreateUserResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CreateUserResponseData _$CreateUserResponseDataFromJson(
        Map<String, dynamic> json) =>
    CreateUserResponseData(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CreateUserResponseDataToJson(
        CreateUserResponseData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
