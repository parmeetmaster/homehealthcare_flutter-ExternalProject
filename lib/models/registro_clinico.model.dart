
import 'package:freezed_annotation/freezed_annotation.dart';
part 'registro_clinico.model.freezed.dart';
part 'registro_clinico.model.g.dart';

@freezed
class RegistroClinico with _$RegistroClinico {
  
  @JsonSerializable(explicitToJson: true)
  const factory RegistroClinico({

    required int  servicio_id,
    required int  id_server_master,
    required String nombre_actividad,
    int? id_movil_master,
    required String json_syncro,

  }) =_RegistroClinico;

  factory RegistroClinico.fromJson(Map<String, dynamic> json) => _$RegistroClinicoFromJson(json);


}