import 'package:hanam/ui/screen/chat_bot/model/message_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_conversation_info_response.g.dart';

@JsonSerializable()
class GetConversationInfoResponse {
  final MessageModel conversation;

  GetConversationInfoResponse({required this.conversation});

  factory GetConversationInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetConversationInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetConversationInfoResponseToJson(this);
}
