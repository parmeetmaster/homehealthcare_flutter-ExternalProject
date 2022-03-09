
import 'package:health_home_care/models/models.dart';

abstract class RegistrosClinicosRepository {
  
 Future<Map<String,dynamic>> getAllRegistroClinicosHttp({ required String token });



}