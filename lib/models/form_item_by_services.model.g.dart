// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_item_by_services.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FormItemByServices _$$_FormItemByServicesFromJson(
        Map<String, dynamic> json) =>
    _$_FormItemByServices(
      id_server_master: json['id_server_master'] as int,
      nombre_actividad: json['nombre_actividad'] as String,
      id_movil_master: json['id_movil_master'] as int?,
      json_syncro: json['json_syncro'] as String,
    );

Map<String, dynamic> _$$_FormItemByServicesToJson(
        _$_FormItemByServices instance) =>
    <String, dynamic>{
      'id_server_master': instance.id_server_master,
      'nombre_actividad': instance.nombre_actividad,
      'id_movil_master': instance.id_movil_master,
      'json_syncro': instance.json_syncro,
    };
