import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../app/core/network/network_info.dart';
import '../../../../models/models.dart';
import '../../../../repositories/respositories.dart';

class ValoracionTerapiaRespiratoriaViewModel extends BaseViewModel {

  final ValoracionTerapiaRespiratoriaRepository _vTerapiaRespiratoriaService = GetIt.I.get();
  final TokenRepository _tokenService = GetIt.I.get();
  final _navigationService = locator<NavigationService>();

  ValoracionTerapiaRespiratoriaViewModel(
        this.patient, 
        this.actividadId,
        this.jsonSyncro
  );

  ScheduleItem patient;
  int actividadId;
  String jsonSyncro;

  bool _isConnected = false;
  get isConnected => _isConnected;
  set isConnected(value) {
    _isConnected = value;
    notifyListeners();
  }

  bool _isSaving = false;
  get isSaving => _isSaving;
  set isSaving( value ) {
    _isSaving = value;
    notifyListeners();
  } 
  
  Map<String, dynamic> _savedToRemoteMsg = {};
  get savedToRemoteMsg => _savedToRemoteMsg;
  set savedToRemoteMsg ( value ) => _savedToRemoteMsg = value;

  int _savedToLocalMsg = 0;
  get savedToLocalMsg => _savedToLocalMsg;
  set savedToLocalMsg ( value ) => _savedToLocalMsg= value;  

  // Validacion de formulario evolucion terapia fisica
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String fechaHora;
  late String tos; 
  late String expectoracion; 
  late String disnea;
  late String spo; 
  late String oxigenoterapia;
  late String sdr; 
  late String patron_respiratorio; 
  late String tipo_torax; 
  late String expansibilidad_toracica; 
  late String distensibilidad_toracica;
  late String auscultacion;
  late String plandemanejo;
  

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool validationFormPassed() {
    return formKey.currentState?.validate() ?? false;
  } 

  // Obtener Token del Store
  Future<Token> getTokenStore() async {
    return await _tokenService.getTokenFromStore();
  }

  saveVTerapiaRespiratoriaForm({ 
        required String fechaHora, 
        required int actividadID,

        required String tos, 
        required String expectoracion, 
        required String disnea,
        required String spo, 
        required String oxigenoterapia,
        required String sdr, 
        required String patron_respiratorio, 
        required String tipo_torax, 
        required String expansibilidad_toracica, 
        required String distensibilidad_toracica,
        required String auscultacion,
        required String plandemanejo,
   }) async {

    final Map<String, dynamic> formData = {
      'activityId': actividadID,
      'jsonSyncro': jsonSyncro,
      'online'    : false,
      'data': {       
          'fecha_actividad'         : fechaHora,
          'tos'                     : tos,
          'expectoracion'           : expectoracion,
          'disnea'                  : disnea,
          'spo'                     : spo,
          'oxigenoterapia'          : oxigenoterapia,
          'sdr'                     : sdr,
          'patron_respiratorio'     : patron_respiratorio,
          'tipo_torax'              : tipo_torax,
          'expansibilidad_toracica' : expansibilidad_toracica,
          'distensibilidad_toracica': distensibilidad_toracica,
          'auscultacion'            : auscultacion,
          'plandemanejo'            : plandemanejo,
      },      
    };
    
    isConnected = await isConnectedToNetwork();

    if (isConnected) {
      formData['online'] = isConnected;
      final token = await getTokenStore();
      savedToRemoteMsg =  await _vTerapiaRespiratoriaService.saveVTerapiaRespiratoriaToRemote(
          token: token.accessToken,  
          formData: formData,
      );
    }

    var recordExists = await _vTerapiaRespiratoriaService.getValoracionTerapiaRespiratoriaSaved(formData['activityId']);

    print(' Registro Clinico Evolucion Terapia Física (registro): ');
    print(recordExists);

    if ( recordExists!.idKey == 0 ) {
       savedToLocalMsg  = await _vTerapiaRespiratoriaService.saveVTerapiaRespiratoriaToLocal(formData: formData);
    }
   

  }

  // Navegar hacia la vista Login (Logout)
  void navigateToLoginView() {
    _navigationService.clearStackAndShow(Routes.loginView);
  }

  void navigateToBack() {
    _navigationService.back();
  }
}
