// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      nombre: json['nombre'] as String,
      primer_apellido: json['primer_apellido'] as String,
      segundo_apellido: json['segundo_apellido'] as String,
      primer_nombre: json['primer_nombre'] as String,
      segundo_nombre: json['segundo_nombre'] as String,
      departamento: json['departamento'] as String,
      municipio: json['municipio'] as String,
      ordenes_asignadas: json['ordenes_asignadas'] as int,
      actividades_asignadas: json['actividades_asignadas'] as String,
      actividades_realizadas: json['actividades_realizadas'] as String,
      perfiles: (json['perfiles'] as List<dynamic>)
          .map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'primer_apellido': instance.primer_apellido,
      'segundo_apellido': instance.segundo_apellido,
      'primer_nombre': instance.primer_nombre,
      'segundo_nombre': instance.segundo_nombre,
      'departamento': instance.departamento,
      'municipio': instance.municipio,
      'ordenes_asignadas': instance.ordenes_asignadas,
      'actividades_asignadas': instance.actividades_asignadas,
      'actividades_realizadas': instance.actividades_realizadas,
      'perfiles': instance.perfiles,
    };
