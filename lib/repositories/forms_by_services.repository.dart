import '../models/models.dart';

abstract class FormsByServicesRepository {
 
 Future<FormByServices> getFormsDataHttp({required String token, required int servicioId});

 Future getFormsDataFromStore({ required int servicioId });

 Future<List> insertFormsInStore ( List forms );

 Future<Map<String, dynamic>> saveAndCloseActivityHttp({ required String token, required actividadId });

 //Future<List> uploadSignature ( List forms );
 

}
