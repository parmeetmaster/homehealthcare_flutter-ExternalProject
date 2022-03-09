// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sembast/sembast.dart';

import '../app/core/utils/app_urls.dart';
import '../models/models.dart';
import '../repositories/forms_by_services.repository.dart';


/// Gestión de los formularios para los registros clinicos
class FormsByServicesRepositoryImpl extends FormsByServicesRepository {

  final Database _db    = GetIt.I.get();
  final StoreRef _store = intMapStoreFactory.store("forms_store");
  
  final baseUrl = AppUrls();

  late FormByServices _forms;
  get forms => _forms;
  set forms(value) => _forms = value;



  /// Obtener los formularios especificos para el registro clinicio según el id del servicio de la nube
  /// parametro: token, servicioId
  @override
  Future<FormByServices> getFormsDataHttp({required String token, required int servicioId}) async {
    
    final resp = await http.get( Uri.parse(baseUrl.getformularios + '/$servicioId' ),
      headers: {
        "Content-Type" : "application/json",
        "Authorization": "Bearer $token"
      },
    );

    final formRawList = jsonDecode(resp.body);
          forms       = FormByServices.fromJson({'item': formRawList});
    return forms;
  }

  
  /// Obtener los formularios especificos para el registro clinicio según el id del servicio localmente
  /// parametro: servicioId
  @override
  Future getFormsDataFromStore({required int servicioId}) async {

    var   finder       = Finder(filter: Filter.equals('servicio_id', servicioId));
    final formsRecords = await _store.find(_db, finder: finder);
    final formsList    = [];

    for (var form in formsRecords) {
      formsList.add(form.value);
    }

    forms = FormByServices.fromJson({'item': formsList});

    return forms;


  }

 
 /// Inserta los formularios en la colección (store) localmente
 /// parametro: Listado de formularios  
  @override
  Future<List> insertFormsInStore(List forms) async {
    final list = [];
    
    for (var form in forms) { 
      list.add(form);
    }     

    return await _store.addAll( _db, list );
  }

  /// Guardado y Cerrado de la Actividad en la Nube.
  /// parametros: token, actividad id
  @override
  Future<Map<String, dynamic>> saveAndCloseActivityHttp({ required String token, required actividadId }) async {
    
    final      fechaHoy     = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
    Map<String, String> msg = {};
    final      url          = baseUrl.registroClinico + '/$actividadId/saveandclose';

    final resp = await http.post(Uri.parse(url),
        headers: {
          "Content-Type" : "application/json",
          "Authorization": "Bearer $token"
        },
        body: json.encode({'fecha_actividad': fechaHoy}));

    final decodedResp = jsonDecode(resp.body);

    if (decodedResp.containsKey('message') && resp.statusCode == 400) {
      print(decodedResp['message']);
      msg = {'errorMsg': 'Registro ya está Guardado.'};
    } else if (decodedResp.containsKey('fecha_actividad') &&
        resp.statusCode == 422) {
      print(decodedResp['fecha_actividad'][0]);
      msg = {'errorMsg': 'Errado el Formato de Fecha.'};
    } else if (decodedResp.containsKey('message') && resp.statusCode == 200) {
      msg = {'successMsg': decodedResp['message']};
    }

    return msg;
    
  }  



 
}
