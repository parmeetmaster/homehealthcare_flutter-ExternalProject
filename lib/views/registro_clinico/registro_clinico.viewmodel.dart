
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../app/core/network/network_info.dart';
import '../../models/models.dart';
import '../../repositories/respositories.dart';

class RegistroClinicoViewModel extends BaseViewModel {

  final TokenRepository _tokenService                    = GetIt.I.get();
  final FormsByServicesRepository _formByServicesService = GetIt.I.get();
  final ActivityRepository _activityService              = GetIt.I.get();
  final _navigationService                               = locator<NavigationService>();

  /// Se reciben los argumentos desde la vista PatientDetailsView
  /// Se carga la lista de formularios.
  RegistroClinicoViewModel(
    this.scheduleItem,
    this.actividadId,
    this.ordenServicioId,
  ) {
    getFormsListData();
  }

  ScheduleItem scheduleItem;
  int actividadId;
  int ordenServicioId;

  bool _isConnected = false;
  get isConnected => _isConnected;
  set isConnected(value) {
    _isConnected = value;
    notifyListeners();
  }

  Map<String, dynamic> _saveAndCloseMsg = {};
  get saveAndCloseMsg => _saveAndCloseMsg;
  set saveAndCloseMsg(value) => _saveAndCloseMsg = value;

  bool _saveAndCloseLocalMsg = true;
  get saveAndCloseLocalMsg => _saveAndCloseLocalMsg;
  set saveAndCloseLocalMsg( value ) => _saveAndCloseLocalMsg = value;

  bool _isSaving = false;
  get isSaving => _isSaving;
  set isSaving(value) => _isSaving = value;

  FormByServices forms = const FormByServices(item: []);

 /// Obtener Token de la colección (Store)
  Future<Token> getTokenStore() async {
    return await _tokenService.getTokenFromStore();
  }

 /// Obtenar la lista de formularios registro clinico
  void getFormsListData() async {
    setBusy(true);

    isConnected = await isConnectedToNetwork();

    if (!isConnected) {
      forms = await _formByServicesService.getFormsDataFromStore( servicioId: scheduleItem.servicio_id );
    } else {
      final token = await getTokenStore();
      forms = await _formByServicesService.getFormsDataHttp(
                          token     : token.accessToken,
                          servicioId: scheduleItem.servicio_id
                    );
    }

    setBusy(false);
  }


 /// Guardar & Cerrar Actividad
  saveAndCloseActividad({required int actividadId}) async {

    isSaving = true;
    notifyListeners();

    isConnected = await isConnectedToNetwork();

    if ( isConnected ) {
      
      final token = await getTokenStore();
      saveAndCloseMsg = await _formByServicesService.saveAndCloseActivityHttp(
                                token      : token.accessToken,
                                actividadId: actividadId
                              );
    }

     saveAndCloseLocalMsg = await _activityService.updateActivityInStore(actividadId: actividadId);

    isSaving = false;
    notifyListeners();
  }


  /// Navegar hacia la vista Login (Logout)
  void navigateToLoginView() {
    _navigationService.clearStackAndShow(Routes.loginView);
  }

  /// Seleccionar formularios y navegar  al formulario seleccionado
  void navigateToForm({required String formName, required ScheduleItem patient, required int actId}) {

    switch (formName) {

      // Registro Clinico Terapia Fisica
      case 'registroclinico_valoracion_terapia_fisica':
           _navigationService.navigateTo( Routes.registroclinico_valoracion_terapia_fisica);
        break;

      case 'registroclinico_evolucion_terapia_fisica':
        _navigationService.navigateTo(
            Routes.registroclinico_evolucion_terapia_fisica,
            arguments: EvolucionTerapiaFisicaViewArguments(
                          patient    : patient,
                          actividadId: actividadId,
                          jsonSyncro : formName
            )
        );
        break;

        // Registro Clinico Terapia Respiratorio        
        case 'registroclinico_valoracion_terapia_respiratoria':
          _navigationService.navigateTo( 
              Routes.registroclinico_valoracion_terapia_respiratoria,
              arguments: ValoracionTerapiaRespiratoriaViewArguments(
                          patient    : patient,
                          actividadId: actividadId,
                          jsonSyncro : formName
                      ));
        break;

        case 'registroclinico_evolucion_terapia_respiratoria':
        _navigationService.navigateTo(
            Routes.registroclinico_evolucion_terapia_respiratoria,
            arguments: EvolucionTerapiaRespiratoriaViewArguments(
                          patient    : patient,
                          actividadId: actividadId,
                          jsonSyncro : formName
                      )
        );
        break;
       
      default:
    }
  }

  /// Navegar hacia la vista Detalles del Paciente
  void navigateToPatientDetailsView({required int ordenServicioId, required ScheduleItem scheduledItem}) {
    _navigationService.navigateTo(
        Routes.patientDetailsView,
        arguments: PatientDetailsViewArguments(
                  ordenServicioId: ordenServicioId,
                  scheduledItem  : scheduledItem,
                )
    );
  } 

  /// Quitar Token al salir de la aplicacion.
  removeToken() async {
    await _tokenService.deleteToken();
  }
 

}
