import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Token {
  Future<String> getToken();
  Future<void> setToken(String token);
  Future<void> deleteToken();
  bool hasToken();
}

class TokenRepository implements Token {
  
  final storage = new FlutterSecureStorage();

  @override
  Future<String> getToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('token');
    // return await storage.read(key: 'token');
  }

  @override
  Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.setString('token', token);
    // return await storage.write(key: 'token', value: token);
  }

  @override
  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    // return await storage.delete(key: 'token');
  }

  @override
  bool hasToken()  {
    var token =  this.getToken();
   if(token != null){
     return true;
   }else {
     return false;
   }
  }
}
