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

GetListConversation _$GetListConversationFromJson(Map<String, dynamic> json) =>
    GetListConversation(
      data: (json['data'] as List<dynamic>)
          .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetListConversationToJson(
        GetListConversation instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
