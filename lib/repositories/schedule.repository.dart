import 'package:health_home_care/models/models.dart';

abstract class ScheduleRepository {
  
  Future<Schedule> getScheduleDataHttp({ required String token });

  Future<List> insertSchedule ( List schedule );
  
  Future getAllScheduleFromStore();

  Future<Activities> getActivitiesHttp( {required String token, required int ordenServicioId} );



  
}

