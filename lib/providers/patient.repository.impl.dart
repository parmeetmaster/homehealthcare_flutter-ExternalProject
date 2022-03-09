import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';

import '../repositories/respositories.dart';


/// Gestión de Pacientes en la agenda
class PatientRepositoryImpl extends PatientRepository {  
  
  /// Crea la colección (store), y se inserta los pacientes de manera local
  /// parametro: recibe una lista dinamica de pacientes.
  @override
  Future<List<dynamic>> insertPatients( List patients) async {

    final Database _db    = GetIt.I.get();
    final StoreRef _store = intMapStoreFactory.store("patient_store");
    final list            = [];

    for (var patient in patients) { 
      list.add(patient);
    }     

    return await _store.addAll( _db, list );

  }
  




  
}

 