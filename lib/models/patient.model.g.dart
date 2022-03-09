// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Patient _$$_PatientFromJson(Map<String, dynamic> json) => _$_Patient(
      paciente_id: json['paciente_id'] as int,
      tipo_identificacionId: json['tipo_identificacionId'] as int,
      tipo_identificacion: json['tipo_identificacion'] as String,
      identificacion: json['identificacion'] as String,
      primer_nombre: json['primer_nombre'] as String,
      primer_apellido: json['primer_apellido'] as String,
      segundo_nombre: json['segundo_nombre'] as String,
      segundo_apellido: json['segundo_apellido'] as String,
      nombre: json['nombre'] as String,
      fecha_nacimiento: json['fecha_nacimiento'] as String,
      edad: json['edad'] as int,
      telefono: json['telefono'] as String,
      celular: json['celular'] as String,
      departamento: json['departamento'] as String,
      municipio: json['municipio'] as String,
      barrio: json['barrio'] as String,
      direccion: json['direccion'] as String,
      eps: json['eps'] as String,
      geo_lat: (json['geo_lat'] as num).toDouble(),
      geo_lng: (json['geo_lng'] as num).toDouble(),
      cie: (json['cie'] as List<dynamic>)
          .map((e) => Cie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PatientToJson(_$_Patient instance) =>
    <String, dynamic>{
      'paciente_id': instance.paciente_id,
      'tipo_identificacionId': instance.tipo_identificacionId,
      'tipo_identificacion': instance.tipo_identificacion,
      'identificacion': instance.identificacion,
      'primer_nombre': instance.primer_nombre,
      'primer_apellido': instance.primer_apellido,
      'segundo_nombre': instance.segundo_nombre,
      'segundo_apellido': instance.segundo_apellido,
      'nombre': instance.nombre,
      'fecha_nacimiento': instance.fecha_nacimiento,
      'edad': instance.edad,
      'telefono': instance.telefono,
      'celular': instance.celular,
      'departamento': instance.departamento,
      'municipio': instance.municipio,
      'barrio': instance.barrio,
      'direccion': instance.direccion,
      'eps': instance.eps,
      'geo_lat': instance.geo_lat,
      'geo_lng': instance.geo_lng,
      'cie': instance.cie.map((e) => e.toJson()).toList(),
    };
