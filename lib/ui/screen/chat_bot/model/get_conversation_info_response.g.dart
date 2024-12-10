// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_conversation_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetConversationInfoResponse _$GetConversationInfoResponseFromJson(
        Map<String, dynamic> json) =>
    GetConversationInfoResponse(
      conversation:
          MessageModel.fromJson(json['conversation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetConversationInfoResponseToJson(
        GetConversationInfoResponse instance) =>
    <String, dynamic>{
      'conversation': instance.conversation,
    };
