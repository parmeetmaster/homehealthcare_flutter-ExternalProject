
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../app/core/network/network_info.dart';
import '../../../../models/models.dart';
import '../../../../repositories/respositories.dart';

class EvolucionTerapiaRespiratoriaViewModel extends BaseViewModel {

  final EvolucionTerapiaRespiratoriaRepository _eTerapiaRespiratoriaService = GetIt.I.get();
  final TokenRepository _tokenService                                       = GetIt.I.get();
  final _navigationService                                                  = locator<NavigationService>();

  EvolucionTerapiaRespiratoriaViewModel(
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
  late String objetivo;
  late String tratamiento;
  late String respuesta;
  String? observacion;

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

  saveETerapiaRespiratoriaForm({ 
        required String fechaHora, 
        required int actividadID, 
        required String objetivo, 
        required String tratamiento, 
        required String respuesta, 
        String? observacion }) async {

    final Map<String, dynamic> formData = {
      'activityId': actividadID,
      'jsonSyncro': jsonSyncro,
      'online'    : false,
      'data'      : {       
        'fecha_actividad': fechaHora,
        'tratamiento'    : tratamiento,
        'respuesta'      : respuesta,
        'observacion'    : observacion,
        'objetivo'       : objetivo,
      },      
    };
    
    isConnected = await isConnectedToNetwork();

    if (isConnected) {

      formData['online']        = isConnected;
      final    token            = await getTokenStore();
               savedToRemoteMsg = await _eTerapiaRespiratoriaService.saveETerapiaRespiratoriaToRemote(
                                      token   : token.accessToken,
                                      formData: formData,
                                  );
    }

    var recordExists = await _eTerapiaRespiratoriaService.getEvolucionTerapiaRespiratoriaSaved(formData['activityId']);

    print(' Registro Clinico Evolucion Terapia Física (registro): ');
    print(recordExists);

    if ( recordExists!.idKey == 0 ) {
       savedToLocalMsg  = await _eTerapiaRespiratoriaService.saveETerapiaRespiratoriaToLocal(formData: formData);
    }
   

  }

  // Navegar hacia la vista Login (Logout)
  void navigateToLoginView() {
    _navigationService.clearStackAndShow(Routes.loginView);
  }
  
  /// regresar a la vista anteior. 
  void navigateToBack() {
    _navigationService.back();
  }
}
