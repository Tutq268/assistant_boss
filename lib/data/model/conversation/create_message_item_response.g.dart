// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_message_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateMessageItemResponse _$CreateMessageItemResponseFromJson(
        Map<String, dynamic> json) =>
    CreateMessageItemResponse(
      data: MessageItemModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateMessageItemResponseToJson(
        CreateMessageItemResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CreateListMessageResponse _$CreateListMessageResponseFromJson(
        Map<String, dynamic> json) =>
    CreateListMessageResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => MessageItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateListMessageResponseToJson(
        CreateListMessageResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
