
abstract class DataSyncRepository {

 Future<Map<String, dynamic>> getSyncDataHttp({ required String token });
 Future syncRegistroClinicoFormData({ required String token });

 Future postSyncUploadDataHttp({required String token, required List data});

 Future<void> deleteRegistrosClinicosStore();
 Future<void> deleteBaseStores();

 int verifyIfDBExist();

}