
import 'package:freezed_annotation/freezed_annotation.dart';


part 'valoracion_terapia_respiratoria.model.g.dart';
part 'valoracion_terapia_respiratoria.model.freezed.dart';

@freezed
class ValoracionTerapiaRespiratoria with _$ValoracionTerapiaRespiratoria {

  @JsonSerializable(explicitToJson: true)
  const factory ValoracionTerapiaRespiratoria({
     
     int? idKey,
     required int activityId,
     required String jsonSyncro,
     required bool online,     
     required Map<String, dynamic> data,
    

  }) = _ValoracionTerapiaRespiratoria;

  factory ValoracionTerapiaRespiratoria.fromJson(Map<String, dynamic> json) => _$ValoracionTerapiaRespiratoriaFromJson(json);


}

