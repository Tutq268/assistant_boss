import 'package:hanam/foundation/extension/date_formatting.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  @JsonKey(name: 'name', includeIfNull: true, defaultValue: "")
  final String name;
  @JsonKey(name: 'id', includeIfNull: true, defaultValue: "")
  final String id;
  final MessageItemModel? lastMessage;

  MessageModel({
    required this.name,
    required this.id,
    this.lastMessage,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}

@JsonSerializable()
class ChatMemberModel {
  @JsonKey(name: 'accountId', includeIfNull: true, defaultValue: 0)
  final int accountId;
  @JsonKey(name: 'name', includeIfNull: true, defaultValue: "")
  final String name;
  @JsonKey(name: 'role', includeIfNull: true, defaultValue: "")
  final String role;
  final String? avatar;
  @JsonKey(name: 'permission', includeIfNull: true, defaultValue: "")
  final String permission;

  ChatMemberModel(
      {required this.role,
      required this.accountId,
      this.avatar,
      required this.permission,
      required this.name});

  factory ChatMemberModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMemberModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMemberModelToJson(this);
}

@JsonSerializable()
class MessageItemModel {
  @JsonKey(name: 'id', includeIfNull: true, defaultValue: "")
  final String id;
  @JsonKey(name: 'question', includeIfNull: true, defaultValue: "")
  final String question;
  @JsonKey(name: 'answer', includeIfNull: true, defaultValue: "")
  final String answer;
  final DateTime? createdAt;

  String get messgeTime {
    final date = createdAt == null ? DateTime.now() : createdAt!;
    return date.toHHmm();
  }

  MessageItemModel({
    required this.id,
    required this.question,
    required this.answer,
    this.createdAt,
  });

  factory MessageItemModel.fromJson(Map<String, dynamic> json) =>
      _$MessageItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageItemModelToJson(this);
}

@JsonSerializable()
class ChatAttachmentModel {
  @JsonKey(name: 'url', includeIfNull: true, defaultValue: "")
  final String url;
  @JsonKey(name: 'type', includeIfNull: true, defaultValue: "")
  final String type;

  ChatAttachmentModel({required this.url, required this.type});

  factory ChatAttachmentModel.fromJson(Map<String, dynamic> json) =>
      _$ChatAttachmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatAttachmentModelToJson(this);
}
