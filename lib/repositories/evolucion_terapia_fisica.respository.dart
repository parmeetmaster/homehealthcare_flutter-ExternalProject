
import 'package:health_home_care/models/evolucion_terapia_fisica.model.dart';


abstract class EvolucionTerapiaFisicaRepository {

  Future<Map<String, String>> saveETerapiaFisicaToRemote({ 
    required String token, 
    required Map<String, dynamic> formData 
  });

  Future<int> saveETerapiaFisicaToLocal({ required Map<String, dynamic> formData });

  Future updOrInsETerapiaFisica({ required Map<String, dynamic> formData });

  // Future<void> updateEvoTerapiaFisica( EvolucionTerapiaFisica evoTerapiaFisica );

  // Future<void> deleteEvoTerapiaFisica(int id);

  //Future<EvolucionTerapiaFisica> getETerapiaFisicaFromStore();

  Future<EvolucionTerapiaFisica?> getEvolucionTerapiaFisicaSaved(int actividadId);
  
  Future<List> getEvolucionTerapiaFisicaList();
  
 
  
   
 // Future<List<EvolucionTerapiaFisica>> getETerapiasFisicaSavedFrom(); 

}



