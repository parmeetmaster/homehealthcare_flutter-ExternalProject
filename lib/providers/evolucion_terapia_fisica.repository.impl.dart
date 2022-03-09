// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:health_home_care/app/core/utils/app_urls.dart';
import 'package:health_home_care/models/evolucion_terapia_fisica.model.dart';
import 'package:health_home_care/repositories/evolucion_terapia_fisica.respository.dart';
import 'package:http/http.dart' as http;
import 'package:sembast/sembast.dart';


/// Implementación del repositorio para el Registro Clinico Terapia Fisica
class EvolucionTerapiaFisicaRespositoryImpl extends EvolucionTerapiaFisicaRepository {

  /// Llamado a la BD creada al inicializar la aplicación.
  final Database _db = GetIt.I.get();
  /// Creación de la colección para la gestion de los datos.
  final StoreRef _store = intMapStoreFactory.store("registroclinico_evolucion_terapia_fisica");
  final baseUrl = AppUrls();

 
  /// Guarda los datos de la Evolución Terapia Fisica en la nube
  /// parametros: token (guardado en la BD Local), dataForm (datos del formulario) 
  @override
  Future<Map<String, String>> saveETerapiaFisicaToRemote( { required String token,  required Map<String, dynamic> formData } ) async {
    Map<String, String> msg = {};
    try {
      final resp = await http.post(
          Uri.parse(baseUrl.registroClinico +
              '/${formData['activityId']}/evolucion_terapia_fisica'),
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

  /// guardado de los datos Evolución Terapia Física localmente.
  /// parametro: dataForm (datos del formulario) 
  @override
  Future<int> saveETerapiaFisicaToLocal({required Map<String, dynamic> formData}) async {
        return await _store.add(_db, formData);
  } 


  /// Obtener evolución terapia fisica por el Id de la Base de datos local
  /// parametro: id de la actividad. 
  @override
  Future<EvolucionTerapiaFisica> getEvolucionTerapiaFisicaSaved(int actividadId) async {

      int        idKeyIsEmpty          = 0;
      int        activityIdIsEmpty     = 0;
      String     jsonSyncroIsEmpty     = '';
      Map<String, dynamic> dataIsEmpty = {};
      bool       onlineIsEmpty         = false;

      final record = await _store.find( _db, finder: Finder( filter: Filter.equals('activityId', actividadId ) ));

      return EvolucionTerapiaFisica(

            idKey     : record.isEmpty ? idKeyIsEmpty     : record[0].key,
            activityId: record.isEmpty ? activityIdIsEmpty: record[0].value['activityId'],
            jsonSyncro: record.isEmpty ? jsonSyncroIsEmpty: record[0].value['jsonSyncro'],
            data      : record.isEmpty ? dataIsEmpty      : record[0].value['data'],
            online    : record.isEmpty ? onlineIsEmpty    : record[0].value['online']
      );

  }

  
  /// Obtener el listado de la evoluciones fisicas almacenadas en la BD local.
  @override
  Future<List> getEvolucionTerapiaFisicaList() async {

    final list = [];

    final records = await _store.find( _db, finder: Finder( filter: Filter.equals('online', false ) ));
  
    for (var item in records) {
      final map = {
            "actividad_id"        : item.value['activityId'],
            "master_registro_name": item.value['jsonSyncro'],
            "online"              : item.value['online'],
            "fecha_actividad"     : item.value['data']['fecha_actividad'],
            "data"                : item.value['data']
          };
     list.add( map );
    }
    return list;

  }

  /// Actualizar la evolución de la terapia fisica localmente
  /// parametro: formData (objeto datos del formulario)
  @override
  Future updOrInsETerapiaFisica({required Map<String, dynamic> formData}) async{
    
    late var recordId;

    var finder = Finder(filter: Filter.equals('activityId', formData['activityId']));
    var record = await _store.findFirst(_db, finder: finder);

    if ( record != null ) {
      recordId = record.key;
    }
   
    var update =  await _store.record(recordId).put(_db, formData);
   

  }


}


 