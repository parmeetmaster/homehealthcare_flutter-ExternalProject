
abstract class ActivityRepository {

  Future<List> insertActivities ( List activities );  

  Future getAllActivitiesFromStore({ required int ordenServicioId });

   Future<bool> updateActivityInStore({ required actividadId });

  
}