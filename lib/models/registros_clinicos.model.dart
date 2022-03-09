

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_home_care/models/models.dart';

part 'registros_clinicos.model.freezed.dart';
part 'registros_clinicos.model.g.dart';


@freezed
class RegistrosClinicos with _$RegistrosClinicos {

  @JsonSerializable(explicitToJson: true)
  const factory RegistrosClinicos({

    required List<RegistroClinico> item,

  }) =_RegistrosClinicos;


  factory RegistrosClinicos.fromJson(Map<String, dynamic> json) => _$RegistrosClinicosFromJson(json);

  
}