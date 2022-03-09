import 'package:health_home_care/models/models.dart';

abstract class UserRepository {


  Future<User>getUserDataHttp( { required String token} );
  Future<int> insertUser( Map<String, dynamic> user );
  Future getUserDataFromStore();


  
  
}