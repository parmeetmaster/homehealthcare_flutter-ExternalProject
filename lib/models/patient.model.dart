
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_home_care/models/models.dart';

part 'patient.model.g.dart';
part 'patient.model.freezed.dart';

@freezed

class Patient with _$Patient {
  
  @JsonSerializable(explicitToJson: true)
  const factory Patient({


    required int paciente_id,
    required int tipo_identificacionId,
    required String tipo_identificacion,
    required String identificacion,
    required String primer_nombre,
    required String primer_apellido,
    required String segundo_nombre,
    required String segundo_apellido,
    required String nombre,
    required String fecha_nacimiento,
    required int edad,
    required String telefono,
    required String celular,
    required String departamento,
    required String municipio,
    required String barrio,
    required String direccion,
    required String eps,
    required double geo_lat,
    required double geo_lng,
    required List<Cie> cie,

    // required int pacienteId,
    // required int tipoIdentificacionId,
    // required String tipoIdentificacion,
    // required String identificacion,
    // required String primerNombre,
    // required String primerApellido,
    // required String segundoNombre,
    // required String segundoApellido,
    // required String nombre,
    // required String fechaNacimiento,
    // required int edad,
    // required String telefono,
    // required String celular,
    // required String departamento,
    // required String municipio,
    // required String barrio,
    // required String direccion,
    // required String eps,
    // required double geoLat,
    // required double geoLng,
    // required List<Cie> cie,

  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);

}