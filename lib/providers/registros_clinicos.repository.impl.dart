
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../app/core/utils/app_urls.dart';
import '../models/models.dart';
import '../repositories/respositories.dart';


/// Gestion de los registros clinicos implementacion del repositorio
class RegistrosClinicosRepositoryImpl extends RegistrosClinicosRepository {

  final baseUrl = AppUrls();

  late RegistrosClinicos _registrosClinicosData;
  get registrosClinicosData => _registrosClinicosData;
  set registrosClinicosData(value) => _registrosClinicosData = value;


  /// Obtener todos los registros clinicos de la nube
  /// parametros: token
  @override
  Future<Map<String, dynamic>> getAllRegistroClinicosHttp({required String token}) async{
    
    final resp = await http.get( Uri.parse(baseUrl.registrosClinicos ),
      headers: {
        "Content-Type" : "application/json",
        "Authorization": "Bearer $token"
      },
    );

    final             registrosClinicosRawList = jsonDecode(resp.body);
    RegistrosClinicos registrosClinicosData    = RegistrosClinicos.fromJson({'item': registrosClinicosRawList});

    return registrosClinicosData.toJson();

  }
  
}