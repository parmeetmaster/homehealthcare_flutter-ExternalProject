// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cie.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cie _$$_CieFromJson(Map<String, dynamic> json) => _$_Cie(
      codigo: json['codigo'] as String,
      nombre: json['nombre'] as String,
      fecha_diagnostico: json['fecha_diagnostico'] as String?,
      status: json['status'] as int,
    );

Map<String, dynamic> _$$_CieToJson(_$_Cie instance) => <String, dynamic>{
      'codigo': instance.codigo,
      'nombre': instance.nombre,
      'fecha_diagnostico': instance.fecha_diagnostico,
      'status': instance.status,
    };
