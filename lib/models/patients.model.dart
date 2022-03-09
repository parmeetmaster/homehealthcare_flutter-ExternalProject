
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_home_care/models/models.dart';

part 'patients.model.g.dart';
part 'patients.model.freezed.dart';

@freezed
class Patients with _$Patients {

  const factory Patients({
     required List<Patient> items,
  }) = _Patients;

  factory Patients.fromJson(Map<String, dynamic> json) => _$PatientsFromJson(json);


 
}