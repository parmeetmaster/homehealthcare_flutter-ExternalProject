import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../app/core/network/network_info.dart';
import '../../models/models.dart';
import '../../repositories/respositories.dart';

class HomeViewModel extends BaseViewModel {

  /// Creación de las colecciones (stores) para token, y agenda ( schedule )
  final TokenRepository _tokenService       = GetIt.I.get();
  final ScheduleRepository _scheduleService = GetIt.I.get();

  /// Inicialización del servicio de navegación
  final _navigationService = locator<NavigationService>();

  bool _expanded = false;
  get expanded => _expanded;
  set expanded(value){
    _expanded = value;
    notifyListeners();
  }
  var  test = "Full Screen";

  bool _isConnected = false;
  get isConnected => _isConnected;
  set isConnected( value ) {
    _isConnected = value;
    notifyListeners();
  }  

  Schedule schedule = const Schedule(item: []);

  /// Constructor donde se carga los datos, la lista de la agenda
  HomeViewModel(){
    getScheduleListData();
  }

  // Obtener Token del Store
  Future<Token> getTokenStore() async {
    return await _tokenService.getTokenFromStore();
  }

  /// Obtener la lista de pacientes agendados
  void getScheduleListData() async{
    setBusy(true);

      isConnected = await isConnectedToNetwork();

      if ( !isConnected ) {
        schedule = await _scheduleService.getAllScheduleFromStore();
      }else{
      final token    = await getTokenStore();
            schedule = await _scheduleService.getScheduleDataHttp(token: token.accessToken );
      }

    setBusy(false);
  }

  /// Quitar Token al salir de la aplicacion.
  removeToken() async{
    await _tokenService.deleteToken();
  }

  /// Navegar hacia la vista Login (Logout)
  void navigateToLoginView() {
      _navigationService.clearStackAndShow(Routes.loginView);
  }

  // Navegar al Home View (Agenda)
  void navigateToHomeView() {
      _navigationService.navigateTo(Routes.homeView);
  }

  // Navegar hacia la vista Detalles del Paciente
  void navigateToPatientDetailsView({ required int ordenServicioId, required ScheduleItem scheduledItem }  ) {
      _navigationService.navigateTo(
              Routes.patientDetailsView, 
              // se crean los argumentos que va a recibir la vista PatientDetailView
              arguments: PatientDetailsViewArguments( 
                          ordenServicioId: ordenServicioId,
                          scheduledItem  : scheduledItem,
                        )
      );

  }

  
  
}