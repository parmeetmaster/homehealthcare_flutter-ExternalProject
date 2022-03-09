
// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_home_care/models/models.dart';

part 'user.model.g.dart';
part 'user.model.freezed.dart';

@freezed
class User with _$User  {
  
  
   const factory User({
    required int id,
    required String nombre,
    required String primer_apellido,
    required String segundo_apellido,
    required String primer_nombre,
    required String segundo_nombre,
    required String departamento,
    required String municipio,
    required int ordenes_asignadas,
    required String actividades_asignadas,
    required String actividades_realizadas,
    required List<Profile> perfiles,
  }) = _User;

  
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);


}


