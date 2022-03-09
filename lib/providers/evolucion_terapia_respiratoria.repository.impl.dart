// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:health_home_care/app/core/utils/app_urls.dart';
import 'package:health_home_care/models/evolucion_terapia_respiratoria.model.dart';
import 'package:health_home_care/repositories/respositories.dart';
import 'package:http/http.dart' as http;
import 'package:sembast/sembast.dart';


/// Gestión de registros clinicos evolución terapia respiratoria 
class EvolucionTerapiaRespiratoriaRespositoryImpl extends EvolucionTerapiaRespiratoriaRepository {

  final Database _db    = GetIt.I.get();
  final StoreRef _store = intMapStoreFactory.store("registroclinico_evolucion_terapia_respiratoria");
  final baseUrl         = AppUrls();


  /// Guaradado de la evolución terapia respiratoria en la nube.
  /// parametro: token ( almacenado localmente ), formData ( datos del formulario )
  @override
  Future<Map<String, String>> saveETerapiaRespiratoriaToRemote({ required String token, required Map<String, dynamic> formData }) async {
    Map<String, String> msg = {};
    try {
      final resp = await http.post(
          Uri.parse(baseUrl.registroClinico +
              '/${formData['activityId']}/evolucion_terapia_respiratoria'),
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

 
  /// Guardado de la evolución terapia respiratoria localmente
  /// parametro: formData ( objeto, datos del formulario )
  @override
  Future<int> saveETerapiaRespiratoriaToLocal(
      {required Map<String, dynamic> formData}) async {
    return await _store.add(_db, formData);
  }


  /// Obtener la evolución terapia respiratoria por el id de actividad de la BD local
  /// parametro: id de la actividad.
  @override
  Future<EvolucionTerapiaRespiratoria> getEvolucionTerapiaRespiratoriaSaved( int actividadId ) async {

    int        idKeyIsEmpty          = 0;
    int        activityIdIsEmpty     = 0;
    String     jsonSyncroIsEmpty     = '';
    Map<String, dynamic> dataIsEmpty = {};
    bool       onlineIsEmpty         = false;

    final record = await _store.find(_db,
        finder: Finder(filter: Filter.equals('activityId', actividadId)));

    return EvolucionTerapiaRespiratoria(
                       idKey              : record.isEmpty ? idKeyIsEmpty : record[0].key,
                       activityId         : record.isEmpty ? activityIdIsEmpty: record[0].value['activityId'],
                       jsonSyncro         : record.isEmpty ? jsonSyncroIsEmpty: record[0].value['jsonSyncro'],
                       data               : record.isEmpty ? dataIsEmpty  : record[0].value['data'],
                       online             : record.isEmpty ? onlineIsEmpty: record[0].value['online']);
  }


  /// Obtener listado de evolución terapia respiratoria de la BD Local
  /// return: listado dinamico
  @override
  Future<List> getEvolucionTerapiaRespiratoriaList() async {
    
    final list    = [];
    final records = await _store.find(_db, finder: Finder(filter: Filter.equals('online', false)));

    for (var item in records) {
      final map = {
        "actividad_id": item.value['activityId'],
        "master_registro_name": item.value['jsonSyncro'],
        "online": item.value['online'],
        "fecha_actividad": item.value['data']['fecha_actividad'],
        "data": item.value['data']
      };
      list.add(map);
    }
    return list;
  }

  
  /// Actualiza la evolución terapia respiratoria
  /// parametro: formData (datos del formulario)
  @override
  Future updOrInsETerapiaRespiratoria({ required Map<String, dynamic> formData }) async {
    late var recordId;

    var finder = Finder(filter: Filter.equals('activityId', formData['activityId']));
    var record = await _store.findFirst(_db, finder: finder);

    if (record != null) {
      recordId = record.key;
    }
    var update = await _store.record(recordId).put(_db, formData);
  }


}
