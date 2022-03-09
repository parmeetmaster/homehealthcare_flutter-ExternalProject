// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:health_home_care/app/core/utils/app_urls.dart';
import 'package:health_home_care/models/valoracion_terapia_respiratoria.model.dart';
import 'package:health_home_care/repositories/respositories.dart';
import 'package:http/http.dart' as http;
import 'package:sembast/sembast.dart';

/// Gestión de Valoración Terapia Respiratoria implementación del respositorio
class ValoracionTerapiaRespiratoriaRespositoryImpl extends ValoracionTerapiaRespiratoriaRepository {

  final Database _db    = GetIt.I.get();
  final StoreRef _store = intMapStoreFactory.store("registroclinico_valoracion_terapia_respiratoria");
  final baseUrl         = AppUrls();

  
  /// Guardar Valoración Terapia Respiratoria por el id de la actividad en la nube
  /// parametros: toke, formData
  @override
  Future<Map<String, String>> saveVTerapiaRespiratoriaToRemote({ required String token, required Map<String, dynamic> formData }) async {
    Map<String, String> msg = {};
    try {
      final resp = await http.post( Uri.parse(baseUrl.registroClinico + '/${formData['activityId']}/valoracion_terapia_respiratoria'),
          headers: {
            "Content-Type" : "application/json",
            "Authorization": "Bearer $token",
          },
          body: json.encode(formData['data']));

      final Map<String, dynamic> decodedResp = json.decode(resp.body);

      if (decodedResp.containsKey('message') && resp.statusCode == 400) {
        print(decodedResp['message']);
        msg = {'errorMsg': 'Registro ya está guardado en la Nube.'};
      } else if (decodedResp.containsKey('fecha_actividad') &&
          resp.statusCode == 422) {
        print(decodedResp['fecha_actividad'][0]);
        msg = {'errorMsg': 'Errado el Formato de Fecha.'};
      } else if (decodedResp.containsKey('message') && resp.statusCode == 200) {
        msg = {'successMsg': decodedResp['message']};
      }
    } catch (e) {
      print(e);
    }

    return msg;
  }

  /// Guardar Valoración Terapia Respiratoria Localmente
  /// parametro: formData
  @override
  Future<int> saveVTerapiaRespiratoriaToLocal({ required Map<String, dynamic> formData }) async {
    return await _store.add(_db, formData);
  }

  /// Obtener Valoración Terapia Respiratoria por el id de la actividad localmente
  /// parametros: actividadId
  @override
  Future<ValoracionTerapiaRespiratoria> getValoracionTerapiaRespiratoriaSaved( int actividadId ) async {

    int        idKeyIsEmpty          = 0;
    int        activityIdIsEmpty     = 0;
    String     jsonSyncroIsEmpty     = '';
    Map<String, dynamic> dataIsEmpty = {};
    bool       onlineIsEmpty         = false;

    final record = await _store.find(_db, finder: Finder(filter: Filter.equals('activityId', actividadId)));

    return ValoracionTerapiaRespiratoria(
        idKey     : record.isEmpty ? idKeyIsEmpty     : record[0].key,
        activityId: record.isEmpty ? activityIdIsEmpty: record[0].value['activityId'],
        jsonSyncro: record.isEmpty ? jsonSyncroIsEmpty: record[0].value['jsonSyncro'],
        data      : record.isEmpty ? dataIsEmpty      : record[0].value['data'],
        online    : record.isEmpty ? onlineIsEmpty    : record[0].value['online']);
  }
  
  
  /// Obtener listado de Valoración Terapia Respiratoria 
  @override
  Future<List> getValoracionTerapiaRespiratoriaList() async {
    
    final list    = [];
    final records = await _store.find(_db, finder: Finder(filter: Filter.equals('online', false)));

    for (var item in records) {
      final map = {
        "actividad_id"        : item.value['activityId'],
        "master_registro_name": item.value['jsonSyncro'],
        "online"              : item.value['online'],
        "fecha_actividad"     : item.value['data']['fecha_actividad'],
        "data"                : item.value['data']
      };
      list.add(map);
    }
    return list;
  }

  
}
