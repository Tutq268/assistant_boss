// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_auth_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiAuthResponseDataImpl _$$ApiAuthResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ApiAuthResponseDataImpl(
      type: json['type'] as String?,
      phone: json['phone'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$ApiAuthResponseDataImplToJson(
        _$ApiAuthResponseDataImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'phone': instance.phone,
      'id': instance.id,
    };
