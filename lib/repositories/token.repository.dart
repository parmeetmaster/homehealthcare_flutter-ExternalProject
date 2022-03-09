import 'package:health_home_care/models/models.dart';

abstract class TokenRepository {

  late Token token;

  Future<String>getTokenDataHttp( String ident, String pass );

  Future<Token> getTokenFromStore();

  Future<int> insertToken( Map<String, dynamic> token );

  deleteToken();
  
  
}