
import 'package:health_home_care/models/valoracion_terapia_respiratoria.model.dart';


abstract class ValoracionTerapiaRespiratoriaRepository {

  Future<Map<String, String>> saveVTerapiaRespiratoriaToRemote({ 
    required String token, 
    required Map<String, dynamic> formData 
  });

  Future<int> saveVTerapiaRespiratoriaToLocal({ required Map<String, dynamic> formData });

  //Future updOrInsETerapiaRespiratoria({ required Map<String, dynamic> formData });

  Future<ValoracionTerapiaRespiratoria?> getValoracionTerapiaRespiratoriaSaved(int actividadId);
  
  Future<List> getValoracionTerapiaRespiratoriaList();

}



