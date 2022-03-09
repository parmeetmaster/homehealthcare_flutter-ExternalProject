
import 'package:intl/intl.dart';

import 'package:get_it/get_it.dart';
import 'package:health_home_care/models/models.dart';
import 'package:health_home_care/repositories/respositories.dart';
import 'package:sembast/sembast.dart';


/// Los métodos implementados aca por lo general se utilizan en la vista correspondiente 
/// a la regla de negocio en este caso a la vista: patient_details.viewmodel.dart
/// que es donde se solicita el llamado de las actividades pendientes y realizadas.
class ActivityRepositoryImpl extends ActivityRepository {

  // Singleton de la BD creada al inicio de la aplicación.
  final Database _db = GetIt.I.get();

  // Creación de la collección (store) para actividades
  final StoreRef _store = intMapStoreFactory.store("activity_store");

  
  // setters & getters  para el modelo actividades.
  late Activities _activities;
  get activities => _activities;
  set activities(value) => _activities = value;
  
  
  /// Recibe una lista de activividades para almacenarlas en _store (activity_store)
  @override
  Future<List> insertActivities(List activities) async{
    
    final list = [];
    
    for (var activity in activities) { 
      list.add(activity);
    }     

    return await _store.addAll( _db, list );
    
  }


  /// Se obtiene todas la actividades de la BD local por el Id de la orden de servicio  
  @override
  Future getAllActivitiesFromStore({ required int ordenServicioId }) async {
    
    var finder = Finder(filter: Filter.equals('id_orden_de_servicio', ordenServicioId));
     
    final activitiesRecords = await _store.find(_db, finder: finder);  

    final activitiesList = [];

    for (var activity in activitiesRecords) {
      activitiesList.add(activity.value);
    }

    activities = Activities.fromJson({'item': activitiesList});

    return activities;
  }


  /// Actualiza la actividad por el Id en el Store local
  @override
  Future<bool> updateActivityInStore({ required actividadId }) async{

    bool activityUpdated = false;
    final fechaHoy = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());

    
    var finder = Finder(filter: Filter.equals('id_actividad', actividadId));
    final activityKey = await _store.findKey( _db, finder: finder );

      // Todo: activityKey retorna null porque no existe localmente la actividad.
      // Todo: esto sucede cuando no se ha sincronizado los datos.
    
    final  activityRecord = _store.record(activityKey);


    final  activityUpdate = await activityRecord.update(_db, {'realizada': 1, 'realizada_at': fechaHoy });


    if ( activityUpdate['realizada'] != null ) {
      activityUpdated = true;
    }
    
    print(activityUpdate['id_actividad'] );
    return activityUpdated;

  }


  
}

