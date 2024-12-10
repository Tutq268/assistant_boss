// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      name: json['name'] as String? ?? '',
      id: json['id'] as String? ?? '',
      lastMessage: json['lastMessage'] == null
          ? null
          : MessageItemModel.fromJson(
              json['lastMessage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'lastMessage': instance.lastMessage,
    };

ChatMemberModel _$ChatMemberModelFromJson(Map<String, dynamic> json) =>
    ChatMemberModel(
      role: json['role'] as String? ?? '',
      accountId: (json['accountId'] as num?)?.toInt() ?? 0,
      avatar: json['avatar'] as String?,
      permission: json['permission'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$ChatMemberModelToJson(ChatMemberModel instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'name': instance.name,
      'role': instance.role,
      'avatar': instance.avatar,
      'permission': instance.permission,
    };

MessageItemModel _$MessageItemModelFromJson(Map<String, dynamic> json) =>
    MessageItemModel(
      id: json['id'] as String? ?? '',
      question: json['question'] as String? ?? '',
      answer: json['answer'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$MessageItemModelToJson(MessageItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

ChatAttachmentModel _$ChatAttachmentModelFromJson(Map<String, dynamic> json) =>
    ChatAttachmentModel(
      url: json['url'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$ChatAttachmentModelToJson(
        ChatAttachmentModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'type': instance.type,
    };
