// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activities_item.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActivitiesItem _$$_ActivitiesItemFromJson(Map<String, dynamic> json) =>
    _$_ActivitiesItem(
      id_actividad: json['id_actividad'] as int,
      id_orden_de_servicio: json['id_orden_de_servicio'] as int,
      id_orden_trabajo: json['id_orden_trabajo'] as int,
      id_servicio: json['id_servicio'] as int,
      servicioName: json['servicioName'] as String,
      realizada_at: json['realizada_at'] as String?,
      realizada: json['realizada'] as int?,
    );

Map<String, dynamic> _$$_ActivitiesItemToJson(_$_ActivitiesItem instance) =>
    <String, dynamic>{
      'id_actividad': instance.id_actividad,
      'id_orden_de_servicio': instance.id_orden_de_servicio,
      'id_orden_trabajo': instance.id_orden_trabajo,
      'id_servicio': instance.id_servicio,
      'servicioName': instance.servicioName,
      'realizada_at': instance.realizada_at,
      'realizada': instance.realizada,
    };
