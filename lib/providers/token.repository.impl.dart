// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:convert';


import 'package:get_it/get_it.dart';
import 'package:health_home_care/app/core/utils/app_urls.dart';
import 'package:health_home_care/models/models.dart';
import 'package:health_home_care/repositories/token.repository.dart';
import 'package:http/http.dart' as http;
import 'package:sembast/sembast.dart';


/// Gestion del token para la autenticación del usuario
class TokenRepositoryImpl extends TokenRepository {
  
  final Database _db    = GetIt.I.get();
  final StoreRef _store = intMapStoreFactory.store("token_store");

  /// Obtener token de la nube
  /// parametro: ident (identificacion del usuario), pass (contraseña)
  @override
  Future<String> getTokenDataHttp(String ident, String pass) async {

    final  baseUrl = AppUrls();
    String resp    = '';
    
    try {
      final Map<String, dynamic> loginData = {
        'identificacion': ident,
        'password'      : pass
      };

      final response = await http.post(Uri.parse(baseUrl.login),
          headers: {"Content-Type": "application/json"},
          body   : json.encode(loginData));

      final Map<String, dynamic> decodedResp = json.decode(response.body);          

      if (decodedResp.containsKey('access_token')) {
        
        token = Token(
            accessToken: decodedResp['access_token'],
            tokenType  : decodedResp['token_type'],
            expiresAt  : decodedResp['expires_at']
        );

      } else {
        token = Token( accessToken: '', tokenType: '', expiresAt: '' );
        resp  = decodedResp['message'];
      }
    } catch (e) {
      print(e);
    }
    return resp;
  }


  /// Insertar el Token en la colección ( Store ) localmente.
  /// parametro: token
  @override
  Future<int> insertToken( token ) async {
    return await _store.add( _db, token);   
  }

  /// Obtener token de la colección (store) localmente almacenada
  @override
  Future<Token> getTokenFromStore() async {
    // Busca el último registro creado
    var   finder       = Finder(sortOrders: [SortOrder(Field.key, false)]);
    final tokenRecords = await _store.findFirst(_db, finder: finder);

    return Token(
        id         : tokenRecords!.key,
        accessToken: tokenRecords.value['accessToken'],
        expiresAt  : tokenRecords.value['expiresAt'],
        tokenType  : tokenRecords.value['tokenType']
    );
  }

 
 /// Eliminar el Token de la colección (Actuamente no esta en uso)
  @override 
  deleteToken() async{
     final oldCount = await _store.count(_db);
     print('Conteo Actual Store (Token): ');
     print( oldCount );

     final finder       = Finder(sortOrders: [SortOrder(Field.key, false)]);
     final key          = await _store.findKey(_db, finder: finder );
     final recordDelete = await _store.record(key).delete(_db);
     
     print(recordDelete);
     final newCount = await _store.count(_db);
     print('Conteo nuevo Store (Token): ');
     print( newCount );

  }


}
