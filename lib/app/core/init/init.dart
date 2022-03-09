// ignore_for_file: avoid_print

import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:health_home_care/providers/providers.dart';
import 'package:health_home_care/repositories/respositories.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class Init {
   static bool connected = false;
  
  static Future<bool> initialize() async {

    connected = await _checkConnectivity();

    if ( connected ) connected = true;

     await _initSembast();
     _registerRepositories();

    return connected;
    
  }

  static Future _initSembast() async {
    final appDir = await getApplicationDocumentsDirectory();
    await appDir.create(recursive: true);
    final dbPath = join(appDir.path, "hhc.db");

    print("Ruta de la BD:");
    print(dbPath);

    final db = await databaseFactoryIo.openDatabase(dbPath).catchError((error) {
      print("error en la base de datos >>> " + error.toString());
      return throw Exception(error);
    });
    GetIt.I.registerSingleton<Database>(db);
  }



  static _registerRepositories() {


    /// Se registran todos los respositorios que son siglenton para ser llamados en cada
    /// implementación se crea practicamente uno por modelo.
    
    GetIt.I.registerLazySingleton<TokenRepository>(() => TokenRepositoryImpl());
    GetIt.I.registerLazySingleton<ScheduleRepository>(() => ScheduleRepositoryImpl());
    GetIt.I.registerLazySingleton<FormsByServicesRepository>( () => FormsByServicesRepositoryImpl());
    
    GetIt.I.registerLazySingleton<UserRepository>( () => UserRepositoryImpl());
    GetIt.I.registerLazySingleton<PatientRepository>( () => PatientRepositoryImpl());
    GetIt.I.registerLazySingleton<ActivityRepository>( () => ActivityRepositoryImpl());
    GetIt.I.registerLazySingleton<DataSyncRepository>( () => DataSyncRepositoryImpl());
    GetIt.I.registerLazySingleton<RegistrosClinicosRepository>( () => RegistrosClinicosRepositoryImpl());
    GetIt.I.registerLazySingleton<EvolucionTerapiaFisicaRepository>( () => EvolucionTerapiaFisicaRespositoryImpl());
    GetIt.I.registerLazySingleton<EvolucionTerapiaRespiratoriaRepository>( () => EvolucionTerapiaRespiratoriaRespositoryImpl());
    GetIt.I.registerLazySingleton<ValoracionTerapiaRespiratoriaRepository>( () => ValoracionTerapiaRespiratoriaRespositoryImpl());


  }

  static Future<bool> _checkConnectivity() async {
    bool isConnected = false;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      }
    } on SocketException catch (e) {
      print(e.message);
    }
 

    return isConnected;
  }
}
