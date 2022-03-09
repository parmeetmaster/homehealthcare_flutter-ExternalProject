// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registros_clinicos.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegistrosClinicos _$$_RegistrosClinicosFromJson(Map<String, dynamic> json) =>
    _$_RegistrosClinicos(
      item: (json['item'] as List<dynamic>)
          .map((e) => RegistroClinico.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RegistrosClinicosToJson(
        _$_RegistrosClinicos instance) =>
    <String, dynamic>{
      'item': instance.item.map((e) => e.toJson()).toList(),
    };
