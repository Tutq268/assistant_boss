import 'package:hanam/data/model/account/account_model.dart';
import 'package:hanam/ui/screen/chat_bot/model/message_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_message_item_response.g.dart';

@JsonSerializable()
class CreateMessageItemResponse {
  MessageItemModel data;
  CreateMessageItemResponse({required this.data});

  factory CreateMessageItemResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateMessageItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateMessageItemResponseToJson(this);
}

@JsonSerializable()
class CreateListMessageResponse {
  List<MessageItemModel> data;
  CreateListMessageResponse({required this.data});

  factory CreateListMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateListMessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateListMessageResponseToJson(this);
}
