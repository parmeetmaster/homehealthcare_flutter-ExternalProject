// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, unnecessary_getters_setters, avoid_print, unused_field, avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:health_home_care/app/app.locator.dart';
import 'package:health_home_care/app/app.router.dart';
import 'package:health_home_care/app/core/network/network_info.dart';
import 'package:health_home_care/models/models.dart';
import 'package:health_home_care/providers/providers.dart';
import 'package:health_home_care/repositories/respositories.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/utils/database_utils.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserProfileViewModel extends BaseViewModel {
  
  UserProfileViewModel() {
    getUserData();
  }

  final _navigationService                                           = locator<NavigationService>();
  final Database _db                                                 = GetIt.I.get();
  final DataSyncRepository _dataSyncService                          = GetIt.I.get();
  final RegistrosClinicosRepository _registrosClinicosService        = GetIt.I.get();
  final EvolucionTerapiaFisicaRepository _evoTeraFisService          = GetIt.I.get();
  final EvolucionTerapiaRespiratoriaRepository _evoTeraRespService   = GetIt.I.get();
  final ValoracionTerapiaRespiratoriaRepository _valoTeraRespService = GetIt.I.get();

  final UserRepository _userService                       = GetIt.I.get();
  final PatientRepository _patientService                 = GetIt.I.get();
  final TokenRepository _tokenService                     = GetIt.I.get();
  final ScheduleRepository _scheduleService               = GetIt.I.get();
  final ActivityRepository _activityService               = GetIt.I.get();
  final FormsByServicesRepository _formsByServicesService = GetIt.I.get();

  User userData = User(
      id                    : 0,
      nombre                : '',
      municipio             : '',
      departamento          : '',
      actividades_asignadas : '',
      actividades_realizadas: '',
      perfiles              : [],
      ordenes_asignadas     : 0,
      primer_apellido       : '',
      primer_nombre         : '',
      segundo_apellido      : '',
      segundo_nombre        : '');

  bool _isConnected = false;
  get isConnected => _isConnected;
  set isConnected(value) {
    _isConnected = value;
    notifyListeners();
  }

  Map<String, dynamic> _dataSync = {};
  get dataSync => _dataSync;
  set dataSync(value) => _dataSync = value;

  List _formsSync = [];
  get formsSync => _formsSync;
  set formsSync(value) => _formsSync = value;

  Map<String, dynamic> _user = {};
  get user => _user;
  set user(value) => _user = value;

  int _userId = 0;
  get userId => _userId;
  set userId(value) => _userId = value;

  List _patientsList = [];
  get patientsList => _patientsList;
  set patientsList(value) => _patientsList = value;

  List _pacientsIds = [];
  get pacientsIds => _pacientsIds;
  set pacientsIds(value) => _pacientsIds = value;

  List _scheduleList = [];
  get scheduleList => _scheduleList;
  set scheduleList(value) => _scheduleList = value;

  List _scheduleIds = [];
  get scheduleIds => _scheduleIds;
  set scheduleIds(value) => _scheduleIds = value;

  List _activityList = [];
  get activityList => _activityList;
  set activityList(value) => _activityList = value;

  List _activityIds = [];
  get activityIds => _activityIds;
  set activityIds(value) => _activityIds = value;

  List _formsIds = [];
  get formsIds => _formsIds;
  set formsIds(value) => _formsIds = value;

  bool _isSynchronizing = false;
  get isSynchronizing => _isSynchronizing;
  set isSynchronizing(value) => _isSynchronizing = value;

  List _registrosClinicosListToUpload = [];
  get registrosClinicosListToUpload => _registrosClinicosListToUpload;
  set registrosClinicosListToUpload(value) =>
      _registrosClinicosListToUpload = value;

  bool _doDownloadSync = true;
  get doDownloadSync => _doDownloadSync;
  set doDownloadSync(value) => _doDownloadSync = value;

  bool _downloadedDone = false;
  get downloadedDone => _downloadedDone;
  set downloadedDone(value) => _downloadedDone = value;

  bool _dataSincronizada = false;
  get dataSincronizada => _dataSincronizada;
  set dataSincronizada(value) => _dataSincronizada = value;

  // Obtener Token del Store
  Future<Token> getTokenStore() async {
    return await _tokenService.getTokenFromStore();
  }

  // Obtenar la datos del usuario
  getUserData() async {
    setBusy(true);

    isConnected = await isConnectedToNetwork();

    if (!isConnected) {
      userData = await _userService.getUserDataFromStore();
    } else {
      final token = await getTokenStore();
      userData = await _userService.getUserDataHttp(token: token.accessToken);
    }

    setBusy(false);
  }

  // sincronizar datos descarga
  syncDownloadDataHttp() async {
    final coleccionesCreadas = getNonEmptyStoreNames(_db);
    print('Colecciones existentes: ');
    print(coleccionesCreadas);

   
    for (var coleccion in coleccionesCreadas) {
      switch (coleccion) {
        
        case 'registroclinico_evolucion_terapia_fisica':
        case 'registroclinico_valoracion_terapia_fisica':
          doDownloadSync = false;
          break;

         case 'registroclinico_evolucion_terapia_respiratoria':
         case 'registroclinico_valoracion_terapia_respiratoria':
          doDownloadSync = false;
          break;

        default:
      }
    }

    if (doDownloadSync) {      

      isSynchronizing = true;
      await _dataSyncService.deleteBaseStores();
      
      final coleccionesCreadas2 = getNonEmptyStoreNames(_db);

      print('Colecciones existentes después de borrar (descargas de datos): ');
      print(coleccionesCreadas2);

      notifyListeners();

      final token     = await getTokenStore();
            dataSync  = await _dataSyncService.getSyncDataHttp(token: token.accessToken);

            formsSync = await _dataSyncService.syncRegistroClinicoFormData( token: token.accessToken );

      formsIds        = await _formsByServicesService.insertFormsInStore(formsSync);
      user            = dataSync['userInfo'];

      userId          = await _userService.insertUser(user);
      patientsList    = dataSync['pacientes'];

      pacientsIds     = await _patientService.insertPatients(patientsList);
      scheduleList    = dataSync['agenda'];

      scheduleIds     = await _scheduleService.insertSchedule(scheduleList);
      activityList    = dataSync['actividades'];

      activityIds     = await _activityService.insertActivities(activityList);


      isSynchronizing = false;
      downloadedDone  = true;
      notifyListeners();
    }
  }

  // sincronizar datos  cargar
  syncUploadDataHttp() async {

    List evolucionTerapiaFisicaList        = [];
    List evolucionTerapiaRespiratoriaList  = [];
    List valoracionTerapiaRespiratoriaList = [];

    final coleccionesCreadas = getNonEmptyStoreNames(_db);
    final token              = await getTokenStore();
    bool  doSync             = false;

    for (var coleccion in coleccionesCreadas) {
      switch (coleccion) {
        
        case 'registroclinico_evolucion_terapia_fisica':
          evolucionTerapiaFisicaList = await _evoTeraFisService.getEvolucionTerapiaFisicaList();
          doSync                     = true;
          break;

        case 'registroclinico_evolucion_terapia_respiratoria':
          evolucionTerapiaRespiratoriaList = await _evoTeraRespService.getEvolucionTerapiaRespiratoriaList();
          doSync                           = true;
          break;

        case 'registroclinico_valoracion_terapia_respiratoria':
          valoracionTerapiaRespiratoriaList = await _valoTeraRespService.getValoracionTerapiaRespiratoriaList();
          doSync                            = true;
          break;

        default:
      }
    }

    isConnected = await isConnectedToNetwork();

    if (doSync && isConnected) {

      isSynchronizing = true;
      notifyListeners();



      if ( evolucionTerapiaFisicaList.isNotEmpty ) {
        evolucionTerapiaFisicaList.forEach((e) => registrosClinicosListToUpload.add(e));
        evolucionTerapiaFisicaList = [];
      }

      if (  evolucionTerapiaRespiratoriaList.isNotEmpty ) {
        evolucionTerapiaRespiratoriaList.forEach((e) => registrosClinicosListToUpload.add(e));
        evolucionTerapiaRespiratoriaList = [];        
      }

      if (  valoracionTerapiaRespiratoriaList.isNotEmpty ) {
        valoracionTerapiaRespiratoriaList.forEach((e) => registrosClinicosListToUpload.add(e));
        valoracionTerapiaRespiratoriaList = [];        
      }

      Map<String, dynamic> uploadResponse = await _dataSyncService.postSyncUploadDataHttp(
                                token: token.accessToken,
                                data : registrosClinicosListToUpload
                          );
      registrosClinicosListToUpload = [];

      await _dataSyncService.deleteRegistrosClinicosStore();     

      await syncDownloadDataHttp();

      isSynchronizing = false;
      notifyListeners();

      return uploadResponse['response'] as List;
    } else {
      return [];
    }
  }

  // Quitar Token al salir de la aplicacion.
  removeToken() async {
    await _tokenService.deleteToken();
  }

  // Navegar hacia la vista Login (Logout)
  void navigateToLoginView() {
    _navigationService.clearStackAndShow(Routes.loginView);
  }

  // Navegar a la vista UploadResponse
  void navigateToUploadResponseView({required List uploadResponse}) {
    _navigationService.navigateTo(
        Routes.uploadResponseView,
        arguments: UploadResponseViewArguments(uploadResponse: uploadResponse )
    );
  }

  // Navegar a la vista perfil de usuario
  void navigateToUserProfile() {
    _navigationService.navigateTo( Routes.userProfileView );
  }
}
