import 'package:json_annotation/json_annotation.dart';

part 'upload_image_response.g.dart';

@JsonSerializable()
class UploadFileResponse {
  @JsonKey(name: 'url', includeIfNull: true, defaultValue: "")
  final String url;

  UploadFileResponse({required this.url});

  factory UploadFileResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadFileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadFileResponseToJson(this);
}
