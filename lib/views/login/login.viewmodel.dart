// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:health_home_care/app/app.locator.dart';
import 'package:health_home_care/app/app.router.dart';
import 'package:health_home_care/app/core/network/network_info.dart';
import 'package:health_home_care/repositories/respositories.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FutureViewModel<bool>  {

  final TokenRepository _tokenService = GetIt.I.get();
  final DataSyncRepository _dataSyncService = GetIt.I.get();
  final _navigationService = locator<NavigationService>();  

  int _storesExits = 0;
  int get storesExits => _storesExits;
  set storesExits( int value ) => _storesExits = value;

  // verifica la conexion con datos
  bool _connected = false;
  bool get connected => _connected;

  set connected(bool value) {
    _connected = value;
    notifyListeners();
  }
  

  /// Se ejecuta al principio de la carga de la vista para 
  /// verificar que esta o no conectado a datos. Devuelve true si esta conectado
  Future<bool> isConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connected = true;
        notifyListeners();
      }
    } on SocketException catch (e) {
      connected = false;
      notifyListeners();
      print(e.message);
    }
    verifyIfthereAreDBStores();

    return connected;

  }

  @override
  Future<bool> futureToRun() => isConnected();
  
  
  // Validar login form
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late String identifier;
  late String password;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool validationFormPassed() {
    return loginFormKey.currentState?.validate() ?? false;
  }

  /// Obtener el token de la colección (store)
  /// y mensaje del servicio
  Future<Map<String, dynamic>> getToken ( String identifier, String password  ) async {
    final msg = await _tokenService.getTokenDataHttp(identifier, password);
    final tk = _tokenService.token;
    return { 'token': tk.toJson(), 'message': msg, };

  }

  /// Guardar token en el Store
  Future<int> insertToken( token ) async {
    return await _tokenService.insertToken(token);
  }

  /// Verifica si hay documentos (store) en la BD
  void verifyIfthereAreDBStores(){
    storesExits = _dataSyncService.verifyIfDBExist();
  }

  /// Navegar hacia la vista home
  navigateToHomeView() {
      _navigationService.clearStackAndShow(Routes.homeView);
  }
  

  
  

  
  



}
