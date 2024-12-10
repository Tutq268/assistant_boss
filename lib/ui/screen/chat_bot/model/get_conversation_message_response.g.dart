// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_conversation_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetConversationMessageResponse _$GetConversationMessageResponseFromJson(
        Map<String, dynamic> json) =>
    GetConversationMessageResponse(
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) => MessageItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GetConversationMessageResponseToJson(
        GetConversationMessageResponse instance) =>
    <String, dynamic>{
      'messages': instance.messages,
    };
