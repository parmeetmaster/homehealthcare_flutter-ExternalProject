
import 'package:freezed_annotation/freezed_annotation.dart';


part 'evolucion_terapia_respiratoria.model.g.dart';
part 'evolucion_terapia_respiratoria.model.freezed.dart';

@freezed
class EvolucionTerapiaRespiratoria with _$EvolucionTerapiaRespiratoria {

  @JsonSerializable(explicitToJson: true)
  const factory EvolucionTerapiaRespiratoria({
     
     int? idKey,
     required int activityId,
     required String jsonSyncro,
     required bool online,     
     required Map<String, dynamic> data,
    //  required String tratamiento,
    //  required String respuesta,
    //  required String objetivo,
    //  required String fecha_actividad,

  }) = _EvolucionTerapiaRespiratoria;

  factory EvolucionTerapiaRespiratoria.fromJson(Map<String, dynamic> json) => _$EvolucionTerapiaRespiratoriaFromJson(json);


}