import 'package:hanam/ui/screen/chat_bot/model/message_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_conversation_message_response.g.dart';

@JsonSerializable()
class GetConversationMessageResponse {
  @JsonKey(name: 'messages', includeIfNull: true, defaultValue: [])
  final List<MessageItemModel> messages;

  GetConversationMessageResponse({required this.messages});

  factory GetConversationMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetConversationMessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetConversationMessageResponseToJson(this);
}
