// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valoracion_terapia_respiratoria.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ValoracionTerapiaRespiratoria _$$_ValoracionTerapiaRespiratoriaFromJson(
        Map<String, dynamic> json) =>
    _$_ValoracionTerapiaRespiratoria(
      idKey: json['idKey'] as int?,
      activityId: json['activityId'] as int,
      jsonSyncro: json['jsonSyncro'] as String,
      online: json['online'] as bool,
      data: json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$_ValoracionTerapiaRespiratoriaToJson(
        _$_ValoracionTerapiaRespiratoria instance) =>
    <String, dynamic>{
      'idKey': instance.idKey,
      'activityId': instance.activityId,
      'jsonSyncro': instance.jsonSyncro,
      'online': instance.online,
      'data': instance.data,
    };
