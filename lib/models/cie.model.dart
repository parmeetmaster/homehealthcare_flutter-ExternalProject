
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cie.model.g.dart';
part 'cie.model.freezed.dart';

@freezed

class Cie with _$Cie {
  
  @JsonSerializable(explicitToJson: true)
  const  factory Cie({

    required String codigo,
    required String nombre,
    String? fecha_diagnostico,
    required int status,

  }) =_Cie;

  factory Cie.fromJson(Map<String, dynamic> json) => _$CieFromJson(json);


}