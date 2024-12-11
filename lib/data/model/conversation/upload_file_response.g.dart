// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_file_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadFileResponse _$UploadFileResponseFromJson(Map<String, dynamic> json) =>
    UploadFileResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => ChatFileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UploadFileResponseToJson(UploadFileResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
