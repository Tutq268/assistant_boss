import 'package:hanam/data/model/account/account_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_user_response.g.dart';

@JsonSerializable()
class CreateUserResponse {
  AccountModel data;
  CreateUserResponse({required this.data});

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserResponseToJson(this);
}

@JsonSerializable()
class CreateUserResponseData {
  final String name;
  final String id;
  CreateUserResponseData({
    required this.id,
    required this.name,
  });

  factory CreateUserResponseData.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserResponseDataToJson(this);
}
