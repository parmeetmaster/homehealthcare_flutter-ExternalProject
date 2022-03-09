// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patients.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Patients _$$_PatientsFromJson(Map<String, dynamic> json) => _$_Patients(
      items: (json['items'] as List<dynamic>)
          .map((e) => Patient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PatientsToJson(_$_Patients instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
