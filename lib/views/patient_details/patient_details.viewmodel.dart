import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../app/core/network/network_info.dart';
import '../../models/models.dart';
import '../../repositories/respositories.dart';

class PatientDetailsViewModel extends BaseViewModel {
  
  final TokenRepository _tokenService         = GetIt.I.get();
  final ScheduleRepository _scheduleService   = GetIt.I.get();
  final ActivityRepository _activitiesService = GetIt.I.get();
  final _navigationService                    = locator<NavigationService>();

  bool _isConnected = false;
  get isConnected => _isConnected;
  set isConnected( value ) {
    _isConnected = value;
    notifyListeners();
  }  

  TextEditingController _identificacionInput = TextEditingController();
  get identificacionInput => _identificacionInput;
  set identificacionInput(value) => _identificacionInput = value;

  Activities _activities = const Activities(item: []);
  get activities => _activities;
  set activities(value) => _activities = value;

  List<ActivitiesItem> _activitiesDone = [];
  List<ActivitiesItem> get activitiesDone => _activitiesDone;
  set activitiesDone(value) => _activitiesDone = value;

  List<ActivitiesItem> _activitiesPending = [];
  List<ActivitiesItem> get activitiesPending => _activitiesPending;
  set activitiesPending(value) => _activitiesPending = value;

  int ordenServicioId;
  ScheduleItem scheduleItem;

  /// Recibe los parametros desde HomeView
  PatientDetailsViewModel( this.ordenServicioId, this.scheduleItem ) {
    getScheduleListData();
  }

// Obtener Token del Store
  Future<Token> getTokenStore() async {
    return await _tokenService.getTokenFromStore();
  }

/// Obtenar la lista de pacientes agendados
  void getScheduleListData() async {
    setBusy(true);

    isConnected = await isConnectedToNetwork();

    if (!isConnected) {

      activities = await _activitiesService.getAllActivitiesFromStore( 
                          ordenServicioId: ordenServicioId 
                   );
    
    } else {
    
      final token      = await getTokenStore();
            activities = await _scheduleService.getActivitiesHttp(
                            token          : token.accessToken,
                            ordenServicioId: ordenServicioId
                          );
    
    }
    _getActivitiesDone();
    _getActivitiesPending();
    setBusy(false);
  }

  // Obtener actividades realizadas
  void _getActivitiesDone() =>
      activitiesDone = activities.item.where((a) => a.realizada == 1).toList();

// Obtener actividades Pendientes.
  void _getActivitiesPending() => activitiesPending =
      activities.item.where((a) => a.realizada != 1).toList();

  // Navegar hacia la vista Login (Logout)
  void navigateToLoginView() {
    _navigationService.clearStackAndShow(Routes.loginView);
  }
}
