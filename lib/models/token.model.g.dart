// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Token _$$_TokenFromJson(Map<String, dynamic> json) => _$_Token(
      id: json['id'] as int?,
      accessToken: json['accessToken'] as String,
      tokenType: json['tokenType'] as String,
      expiresAt: json['expiresAt'] as String,
    );

Map<String, dynamic> _$$_TokenToJson(_$_Token instance) => <String, dynamic>{
      'id': instance.id,
      'accessToken': instance.accessToken,
      'tokenType': instance.tokenType,
      'expiresAt': instance.expiresAt,
    };
