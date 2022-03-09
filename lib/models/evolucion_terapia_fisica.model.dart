
import 'package:freezed_annotation/freezed_annotation.dart';


part 'evolucion_terapia_fisica.model.g.dart';
part 'evolucion_terapia_fisica.model.freezed.dart';

@freezed
class EvolucionTerapiaFisica with _$EvolucionTerapiaFisica {

  @JsonSerializable(explicitToJson: true)

  const factory EvolucionTerapiaFisica({
     
     int? idKey,
     required int activityId,
     required String jsonSyncro,
     required bool online,     
     required Map<String, dynamic> data,
    

  }) = _EvolucionTerapiaFisica;

  factory EvolucionTerapiaFisica.fromJson(Map<String, dynamic> json) => _$EvolucionTerapiaFisicaFromJson(json);


}