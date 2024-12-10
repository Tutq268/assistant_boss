// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_conversation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateConversationResponse _$CreateConversationResponseFromJson(
        Map<String, dynamic> json) =>
    CreateConversationResponse(
      data: MessageModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateConversationResponseToJson(
        CreateConversationResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
