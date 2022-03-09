// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_item_by_services.model.freezed.dart';
part 'form_item_by_services.model.g.dart';


@freezed
class FormItemByServices with _$FormItemByServices {

  const factory FormItemByServices({

    required int id_server_master,
    required String nombre_actividad,
    int? id_movil_master,
    required String json_syncro

  }) = _FormItemByServices;

  factory FormItemByServices.fromJson(Map<String, dynamic> json) =>
      _$FormItemByServicesFromJson(json);






}
