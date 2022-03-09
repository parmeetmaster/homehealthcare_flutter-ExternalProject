import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sembast/sembast.dart';

import '../app/core/utils/app_urls.dart';
import '../models/models.dart';
import '../repositories/respositories.dart';

/// Gestión del usuario implementación del respositorio
class UserRepositoryImpl extends UserRepository {

  final baseUrl         = AppUrls();
  final Database _db    = GetIt.I.get();
  final StoreRef _store = intMapStoreFactory.store("user_store");

 // Obtener los datos del usuario de la nube
 /// parametros: token
  @override
  Future<User> getUserDataHttp({required String token}) async {

    late User user;

    final resp = await http.get( Uri.parse(baseUrl.usuario ),
      headers: {
        "Content-Type" : "application/json",
        "Authorization": "Bearer $token"
      },
    );

    final userMap = jsonDecode(resp.body);
          user    = User.fromJson(userMap);

    return user;
  }


  // Obtener datos del usuario de la Colección (Store) local.
  @override
  Future getUserDataFromStore() async {
    
    var   finder  = Finder(sortOrders: [SortOrder(Field.key, false)]);
    final userMap = await _store.findFirst(_db, finder: finder);

    return User(
      id                    : userMap!.key,
      nombre                : userMap.value["nombre"],
      primer_apellido       : userMap.value["primer_apellido"],
      segundo_apellido      : userMap.value["segundo_apellido"],
      primer_nombre         : userMap.value["primer_nombre"],
      segundo_nombre        : userMap.value["segundo_nombre"],
      departamento          : userMap.value["departamento"],
      municipio             : userMap.value["municipio"],
      ordenes_asignadas     : userMap.value["ordenes_asignadas"],
      actividades_asignadas : userMap.value["actividades_asignadas"],
      actividades_realizadas: userMap.value["actividades_realizadas"],
      perfiles              : List<Profile>.from( userMap.value["perfiles"].map((x) => Profile.fromJson(x))),
    );

  }

  
  /// Insertar datos del usuario en la colección local (store)
  /// parametro: objeto User
  @override
  Future<int> insertUser( Map<String, dynamic> user) async {
    return await _store.add(_db, user);
  }


}
