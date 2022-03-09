// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolucion_terapia_fisica.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EvolucionTerapiaFisica _$$_EvolucionTerapiaFisicaFromJson(
        Map<String, dynamic> json) =>
    _$_EvolucionTerapiaFisica(
      idKey: json['idKey'] as int?,
      activityId: json['activityId'] as int,
      jsonSyncro: json['jsonSyncro'] as String,
      online: json['online'] as bool,
      data: json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$_EvolucionTerapiaFisicaToJson(
        _$_EvolucionTerapiaFisica instance) =>
    <String, dynamic>{
      'idKey': instance.idKey,
      'activityId': instance.activityId,
      'jsonSyncro': instance.jsonSyncro,
      'online': instance.online,
      'data': instance.data,
    };
