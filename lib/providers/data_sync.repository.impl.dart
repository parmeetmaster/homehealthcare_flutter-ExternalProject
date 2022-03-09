// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:health_home_care/app/core/utils/app_urls.dart';
import 'package:health_home_care/repositories/respositories.dart';
import 'package:http/http.dart' as http;
import 'package:sembast/sembast.dart';
import 'package:sembast/utils/database_utils.dart';


/// Implementación del repositorio para la sincronización de datos
/// Carga y descarga de datos

class DataSyncRepositoryImpl extends DataSyncRepository {
  final Database _db = GetIt.I.get();
  final baseUrl = AppUrls();
  
  /// Obtener los dastos sincronizados (descarga de datos)
  /// recibe como parámetro el token al macenado en la BD
  @override
  Future<Map<String, dynamic>> getSyncDataHttp({required String token}) async {
    Map<String, dynamic> data = {};

    try {
      final resp = await http.get(
        Uri.parse(baseUrl.syncHccData),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      data = jsonDecode(resp.body);
    } catch (e) {
      print(e);
    }

    return data;
  }

  /// Verifica si la Base de datos existe
  @override
  int verifyIfDBExist() {
    var names = getNonEmptyStoreNames(_db);
    return names.length;
  }

 /// Sincroniza los datos de los formularios para registro clínico
 /// parametro: token almacenado en la BD Local
  @override
  Future syncRegistroClinicoFormData({required String token}) async {
    List formsData = [];

    try {
      final resp = await http.get(
        Uri.parse(baseUrl.registrosClinicos),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      formsData = jsonDecode(resp.body);
    } catch (e) {
      print(e);
    }

    return formsData;
  }

 /// Sincronización de los datos, Subida de datos a la nube
 /// parametro: recibe una lista de los datos a subir 
  @override
  Future postSyncUploadDataHttp({ required String token, required List data }) async {
    
    Map<String, dynamic> decodedResp = {};
    try {

      final resp = await http.post(Uri.parse(baseUrl.syncHccUploadData),
                          headers: {
                            "Content-Type": "application/json",
                            "Authorization": "Bearer $token"
                          },
                          body: json.encode(data)
                   );
      decodedResp = jsonDecode(resp.body);
          
    } catch (e) {
      print(e);
    }

    return decodedResp;
  }


  /// Elimina los datos de los registros clinicos en la Colección (Store)
  /// hasta el momento solo elimina los datos de los dos stores o coleccione se que se indican como variables en el metodo.
  @override
   Future<void> deleteRegistrosClinicosStore() async {
     
    final StoreRef _storeEvolucionTerapiaFisica       = intMapStoreFactory.store("registroclinico_evolucion_terapia_fisica");
    final StoreRef _storeEvolucionTerapiaRespiratoria = intMapStoreFactory.store("registroclinico_evolucion_terapia_respiratoria");
     
    
    final coleccionesCreadas = getNonEmptyStoreNames(_db);

    for (var coleccion in coleccionesCreadas) {
      switch (coleccion) {
        
        case 'registroclinico_evolucion_terapia_fisica':
          await _storeEvolucionTerapiaFisica.delete(_db);
          break;

        case 'registroclinico_evolucion_terapia_respiratoria':
          await _storeEvolucionTerapiaRespiratoria.delete(_db);         
          break;

        default:
      }
    }

  


}

  
  /// Borrado de los datos de las colecciones que se indican en el método
  /// se utiliza para actualizar la descarga de los datos al movil
  @override
  Future<void> deleteBaseStores() async{

    final StoreRef _storeForms    = intMapStoreFactory.store("forms_store");
    final StoreRef _storeUser     = intMapStoreFactory.store("user_store");
    final StoreRef _storeSchedule = intMapStoreFactory.store("schedule_store");
    final StoreRef _storePatient  = intMapStoreFactory.store("patient_store");
    final StoreRef _storeActivity = intMapStoreFactory.store("activity_store");


          await _storeForms.delete(_db);
          await _storeUser.delete(_db);  
          await _storeSchedule.delete(_db);  
          await _storePatient.delete(_db);   
          await _storeActivity.delete(_db);     

   
    
    // final coleccionesCreadas = getNonEmptyStoreNames(_db);

    // for (var coleccion in coleccionesCreadas) {
    //   switch (coleccion) {
        
    //     case 'forms_store':
    //       await _storeForms.delete(_db);
    //       break;

    //     case 'user_store':
    //       await _storeUser.delete(_db);         
    //       break;

    //     case 'schedule_store':
    //       await _storeSchedule.delete(_db);         
    //       break;
        
    //     case 'patient_store':
    //       await _storePatient.delete(_db);         
    //       break;

    //     case 'activity_store':
    //       await _storeActivity.delete(_db);         
    //       break;

    //     default:
    //   }
    // }





  }


}
