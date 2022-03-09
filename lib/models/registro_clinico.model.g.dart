// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registro_clinico.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegistroClinico _$$_RegistroClinicoFromJson(Map<String, dynamic> json) =>
    _$_RegistroClinico(
      servicio_id: json['servicio_id'] as int,
      id_server_master: json['id_server_master'] as int,
      nombre_actividad: json['nombre_actividad'] as String,
      id_movil_master: json['id_movil_master'] as int?,
      json_syncro: json['json_syncro'] as String,
    );

Map<String, dynamic> _$$_RegistroClinicoToJson(_$_RegistroClinico instance) =>
    <String, dynamic>{
      'servicio_id': instance.servicio_id,
      'id_server_master': instance.id_server_master,
      'nombre_actividad': instance.nombre_actividad,
      'id_movil_master': instance.id_movil_master,
      'json_syncro': instance.json_syncro,
    };
