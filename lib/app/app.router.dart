// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../models/models.dart';
import '../views/views.dart';

class Routes {
  static const String loginView = '/';
  static const String homeView = '/home-view';
  static const String userProfileView = '/user-profile-view';
  static const String patientDetailsView = '/patient-details-view';
  static const String registroClinicoView = '/registro-clinico-view';
  static const String uploadResponseView = '/upload-response-view';
  static const String registroclinico_valoracion_terapia_fisica =
      '/valoracion-terapia-fisica-view';
  static const String registroclinico_evolucion_terapia_fisica =
      '/evolucion-terapia-fisica-view';
  static const String registroclinico_valoracion_terapia_respiratoria =
      '/valoracion-terapia-respiratoria-view';
  static const String registroclinico_evolucion_terapia_respiratoria =
      '/evolucion-terapia-respiratoria-view';
  static const all = <String>{
    loginView,
    homeView,
    userProfileView,
    patientDetailsView,
    registroClinicoView,
    uploadResponseView,
    registroclinico_valoracion_terapia_fisica,
    registroclinico_evolucion_terapia_fisica,
    registroclinico_valoracion_terapia_respiratoria,
    registroclinico_evolucion_terapia_respiratoria,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.userProfileView, page: UserProfileView),
    RouteDef(Routes.patientDetailsView, page: PatientDetailsView),
    RouteDef(Routes.registroClinicoView, page: RegistroClinicoView),
    RouteDef(Routes.uploadResponseView, page: UploadResponseView),
    RouteDef(Routes.registroclinico_valoracion_terapia_fisica,
        page: ValoracionTerapiaFisicaView),
    RouteDef(Routes.registroclinico_evolucion_terapia_fisica,
        page: EvolucionTerapiaFisicaView),
    RouteDef(Routes.registroclinico_valoracion_terapia_respiratoria,
        page: ValoracionTerapiaRespiratoriaView),
    RouteDef(Routes.registroclinico_evolucion_terapia_respiratoria,
        page: EvolucionTerapiaRespiratoriaView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    HomeView: (data) {
      var args = data.getArgs<HomeViewArguments>(
        orElse: () => HomeViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(key: args.key),
        settings: data,
      );
    },
    UserProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserProfileView(),
        settings: data,
      );
    },
    PatientDetailsView: (data) {
      var args = data.getArgs<PatientDetailsViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => PatientDetailsView(
          key: args.key,
          ordenServicioId: args.ordenServicioId,
          scheduledItem: args.scheduledItem,
        ),
        settings: data,
      );
    },
    RegistroClinicoView: (data) {
      var args = data.getArgs<RegistroClinicoViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegistroClinicoView(
          key: args.key,
          scheduledItem: args.scheduledItem,
          actividadId: args.actividadId,
          ordenServicioId: args.ordenServicioId,
        ),
        settings: data,
      );
    },
    UploadResponseView: (data) {
      var args = data.getArgs<UploadResponseViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => UploadResponseView(
          key: args.key,
          uploadResponse: args.uploadResponse,
        ),
        settings: data,
      );
    },
    ValoracionTerapiaFisicaView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ValoracionTerapiaFisicaView(),
        settings: data,
      );
    },
    EvolucionTerapiaFisicaView: (data) {
      var args =
          data.getArgs<EvolucionTerapiaFisicaViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => EvolucionTerapiaFisicaView(
          key: args.key,
          patient: args.patient,
          actividadId: args.actividadId,
          jsonSyncro: args.jsonSyncro,
        ),
        settings: data,
      );
    },
    ValoracionTerapiaRespiratoriaView: (data) {
      var args = data.getArgs<ValoracionTerapiaRespiratoriaViewArguments>(
          nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ValoracionTerapiaRespiratoriaView(
          key: args.key,
          patient: args.patient,
          actividadId: args.actividadId,
          jsonSyncro: args.jsonSyncro,
        ),
        settings: data,
      );
    },
    EvolucionTerapiaRespiratoriaView: (data) {
      var args = data.getArgs<EvolucionTerapiaRespiratoriaViewArguments>(
          nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => EvolucionTerapiaRespiratoriaView(
          key: args.key,
          patient: args.patient,
          actividadId: args.actividadId,
          jsonSyncro: args.jsonSyncro,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// HomeView arguments holder class
class HomeViewArguments {
  final Key? key;
  HomeViewArguments({this.key});
}

/// PatientDetailsView arguments holder class
class PatientDetailsViewArguments {
  final Key? key;
  final int ordenServicioId;
  final ScheduleItem scheduledItem;
  PatientDetailsViewArguments(
      {this.key, required this.ordenServicioId, required this.scheduledItem});
}

/// RegistroClinicoView arguments holder class
class RegistroClinicoViewArguments {
  final Key? key;
  final ScheduleItem scheduledItem;
  final int actividadId;
  final int ordenServicioId;
  RegistroClinicoViewArguments(
      {this.key,
      required this.scheduledItem,
      required this.actividadId,
      required this.ordenServicioId});
}

/// UploadResponseView arguments holder class
class UploadResponseViewArguments {
  final Key? key;
  final List<dynamic> uploadResponse;
  UploadResponseViewArguments({this.key, required this.uploadResponse});
}

/// EvolucionTerapiaFisicaView arguments holder class
class EvolucionTerapiaFisicaViewArguments {
  final Key? key;
  final ScheduleItem patient;
  final int actividadId;
  final String jsonSyncro;
  EvolucionTerapiaFisicaViewArguments(
      {this.key,
      required this.patient,
      required this.actividadId,
      required this.jsonSyncro});
}

/// ValoracionTerapiaRespiratoriaView arguments holder class
class ValoracionTerapiaRespiratoriaViewArguments {
  final Key? key;
  final ScheduleItem patient;
  final int actividadId;
  final String jsonSyncro;
  ValoracionTerapiaRespiratoriaViewArguments(
      {this.key,
      required this.patient,
      required this.actividadId,
      required this.jsonSyncro});
}

/// EvolucionTerapiaRespiratoriaView arguments holder class
class EvolucionTerapiaRespiratoriaViewArguments {
  final Key? key;
  final ScheduleItem patient;
  final int actividadId;
  final String jsonSyncro;
  EvolucionTerapiaRespiratoriaViewArguments(
      {this.key,
      required this.patient,
      required this.actividadId,
      required this.jsonSyncro});
}
