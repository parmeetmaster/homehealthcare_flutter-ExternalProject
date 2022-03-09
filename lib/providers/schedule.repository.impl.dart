// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:health_home_care/app/core/utils/app_urls.dart';
import 'package:health_home_care/models/models.dart';
import 'package:health_home_care/repositories/respositories.dart';
import 'package:http/http.dart' as http;
import 'package:sembast/sembast.dart';


/// Gestion de la Agenda (Schedule) de los pacientes implementación del respositorio
class ScheduleRepositoryImpl extends ScheduleRepository {

  final Database _db    = GetIt.I.get();
  final StoreRef _store = intMapStoreFactory.store("schedule_store");
  final baseUrl         = AppUrls();

  late Schedule _schedule;
  get schedule => _schedule;
  set schedule( value ) => _schedule = value;

  late Activities _activities;
  get activities => _activities;
  set activities(value) => _activities = value;

  /// Obtener Agenda (Schedule) de la nube
  /// parametro: token
  @override
  Future<Schedule> getScheduleDataHttp({required String token}) async {   

    final resp = await http.get(
      Uri.parse(baseUrl.schedule),
      headers: {
        "Content-Type" : "application/json",
        "Authorization": "Bearer $token"
      },
    );

    final scheduleRawList = jsonDecode(resp.body);
          schedule        = Schedule.fromJson({'item': scheduleRawList});
    return schedule;
  }


  /// Insertar Agenda (schedule) en la Base de datos local
  /// parametro: lista dinamica de la agenda
  @override
  Future<List<dynamic>> insertSchedule(List schedule) async {

    final list = [];
    for (var schedule in schedule) {
      list.add(schedule);
    }

    return await _store.addAll(_db, list);
  }


  /// Obtener todos los item de la agenda ( schedule ) de la colección (store) local
  @override
  Future getAllScheduleFromStore() async {

    final scheduleRecords = await _store.find(_db);
    final scheduleList    = [];

    for (var schedule in scheduleRecords) {
      scheduleList.add(schedule.value);
    }

    schedule = Schedule.fromJson({'item': scheduleList});

    return schedule;
  }

  /// Obtener actividades por orden de servicio Id de la nube
  /// parametros token, ordenServicioId
  @override
  Future<Activities> getActivitiesHttp({required String token, required int ordenServicioId}) async {

    final resp = await http.get( Uri.parse(baseUrl.actividades + '/$ordenServicioId/actividades'),
      headers: {
        "Content-Type" : "application/json",
        "Authorization": "Bearer $token"
      },
    );

    final activitiesRawList = jsonDecode(resp.body);
          activities        = Activities.fromJson({'item': activitiesRawList});

    return activities;
  } 

  
}
