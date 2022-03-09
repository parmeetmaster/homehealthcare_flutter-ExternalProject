

import 'package:health_home_care/models/models.dart';

abstract class PatientRepository {

  Future<List> insertPatients ( List patients );

  
}