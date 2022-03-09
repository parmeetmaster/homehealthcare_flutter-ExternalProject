
// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'activities_item.model.freezed.dart';
part 'activities_item.model.g.dart';


@freezed
class ActivitiesItem with _$ActivitiesItem {
  
  const factory ActivitiesItem({  

    required int id_actividad,
    required int id_orden_de_servicio,
    required int id_orden_trabajo,
    required int id_servicio,
    required String servicioName,
    String? realizada_at,
    int? realizada,


  }) = _ActivitiesItem;

  factory ActivitiesItem.fromJson(Map<String, dynamic> json) => _$ActivitiesItemFromJson(json);


}