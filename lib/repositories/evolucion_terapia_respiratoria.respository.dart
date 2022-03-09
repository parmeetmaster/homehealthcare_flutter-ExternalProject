
import 'package:health_home_care/models/evolucion_terapia_respiratoria.model.dart';


abstract class EvolucionTerapiaRespiratoriaRepository {

  Future<Map<String, String>> saveETerapiaRespiratoriaToRemote({ 
    required String token, 
    required Map<String, dynamic> formData 
  });

  Future<int> saveETerapiaRespiratoriaToLocal({ required Map<String, dynamic> formData });

  Future updOrInsETerapiaRespiratoria({ required Map<String, dynamic> formData });

  Future<EvolucionTerapiaRespiratoria?> getEvolucionTerapiaRespiratoriaSaved(int actividadId);
  
  Future<List> getEvolucionTerapiaRespiratoriaList();
  
 
  
   
 // Future<List<EvolucionTerapiaFisica>> getETerapiasFisicaSavedFrom(); 

}



