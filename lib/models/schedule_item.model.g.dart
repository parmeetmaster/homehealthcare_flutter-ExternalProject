// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_item.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScheduleItem _$$_ScheduleItemFromJson(Map<String, dynamic> json) =>
    _$_ScheduleItem(
      paciente: Patient.fromJson(json['paciente'] as Map<String, dynamic>),
      ordentrabajo_id: json['ordentrabajo_id'] as int,
      ordentrabajo_validahasta: json['ordentrabajo_validahasta'] as String,
      ordenservicio_id: json['ordenservicio_id'] as int,
      servicio_id: json['servicio_id'] as int,
      servicio: json['servicio'] as String,
      actividades_asignadas: json['actividades_asignadas'] as int,
      actividades_realizadas: json['actividades_realizadas'] as int,
    );

Map<String, dynamic> _$$_ScheduleItemToJson(_$_ScheduleItem instance) =>
    <String, dynamic>{
      'paciente': instance.paciente.toJson(),
      'ordentrabajo_id': instance.ordentrabajo_id,
      'ordentrabajo_validahasta': instance.ordentrabajo_validahasta,
      'ordenservicio_id': instance.ordenservicio_id,
      'servicio_id': instance.servicio_id,
      'servicio': instance.servicio,
      'actividades_asignadas': instance.actividades_asignadas,
      'actividades_realizadas': instance.actividades_realizadas,
    };
