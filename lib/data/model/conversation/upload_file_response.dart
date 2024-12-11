import 'package:hanam/data/model/account/account_model.dart';
import 'package:hanam/ui/screen/chat_bot/model/message_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upload_file_response.g.dart';

@JsonSerializable()
class UploadFileResponse {
  List<ChatFileModel> data;
  UploadFileResponse({required this.data});

  factory UploadFileResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadFileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadFileResponseToJson(this);
}
