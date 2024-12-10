// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpResponse _$VerifyOtpResponseFromJson(Map<String, dynamic> json) =>
    VerifyOtpResponse(
      id: json['id'] as String,
      verifyCode: json['verifyCode'] as String,
      phone: json['phone'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$VerifyOtpResponseToJson(VerifyOtpResponse instance) =>
    <String, dynamic>{
      'verifyCode': instance.verifyCode,
      'type': instance.type,
      'phone': instance.phone,
      'id': instance.id,
    };
