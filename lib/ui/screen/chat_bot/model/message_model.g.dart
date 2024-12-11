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
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'lastMessage': instance.lastMessage,
      'createdAt': instance.createdAt?.toIso8601String(),
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
      conversation: json['conversation'] as String? ?? '',
      link: json['link'] as String?,
      file: json['file'] == null
          ? null
          : ChatFileModel.fromJson(json['file'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageItemModelToJson(MessageItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
      'conversation': instance.conversation,
      'link': instance.link,
      'createdAt': instance.createdAt?.toIso8601String(),
      'file': instance.file,
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

ChatFileModel _$ChatFileModelFromJson(Map<String, dynamic> json) =>
    ChatFileModel(
      path: json['path'] as String? ?? '',
      type: json['type'] as String? ?? '',
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      size: (json['size'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$ChatFileModelToJson(ChatFileModel instance) =>
    <String, dynamic>{
      'path': instance.path,
      'type': instance.type,
      'size': instance.size,
      'id': instance.id,
      'name': instance.name,
    };
