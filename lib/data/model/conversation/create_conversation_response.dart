import 'package:hanam/data/model/account/account_model.dart';
import 'package:hanam/ui/screen/chat_bot/model/message_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_conversation_response.g.dart';

@JsonSerializable()
class CreateConversationResponse {
  MessageModel data;
  CreateConversationResponse({required this.data});

  factory CreateConversationResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateConversationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateConversationResponseToJson(this);
}

@JsonSerializable()
class GetListConversation {
  List<MessageModel> data;
  GetListConversation({required this.data});

  factory GetListConversation.fromJson(Map<String, dynamic> json) =>
      _$GetListConversationFromJson(json);

  Map<String, dynamic> toJson() => _$GetListConversationToJson(this);
}
