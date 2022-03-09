
import 'package:freezed_annotation/freezed_annotation.dart';

import 'models.dart';
part 'schedule_item.model.g.dart';
part 'schedule_item.model.freezed.dart';


@freezed
class ScheduleItem with _$ScheduleItem  {
    
  @JsonSerializable(explicitToJson: true)
  const factory ScheduleItem({

    required Patient paciente,
    required int ordentrabajo_id,
    required String ordentrabajo_validahasta,
    required int ordenservicio_id,
    required int servicio_id,
    required String servicio,
    required int actividades_asignadas,
    required int actividades_realizadas,


  }) =_ScheduleItem;

  factory ScheduleItem.fromJson(Map<String, dynamic> json) => _$ScheduleItemFromJson(json);



}

