import 'package:flutter_repo/data/token_repository.dart';
import 'package:flutter_repo/models/auth-user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'dart:io';

abstract class AuthRepository {
  Future<AuthUser> doLogin(data);
  Future<AuthUser> doRegister(data);
  Future<String> passwordReset(email);
}

class Auth implements AuthRepository {
  final baseUrl = "http://10.0.2.2:8000/api/v1";
  final TokenRepository tokenRepository = TokenRepository();

  @override
  Future<AuthUser> doLogin(data) async {
    final response = await http.post('$baseUrl/user/login', body: data);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data['success']['user']);
      tokenRepository.setToken(data['success']['token']);
      return AuthUser.fromJson(data['success']['user']);
    } else {
      //  print(response.statusCode);
      throw new Exception('Failed To Login User');
    }
  }

  @override
  Future<AuthUser> doRegister(data) async {
    final response = await http.post('$baseUrl/user/register', body: data);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      tokenRepository.setToken(data['success']['token']);
      return AuthUser.fromJson(data['success']['user']);
    } else {
      throw new Exception('Failed To Register User');
    }
  }

  @override
  Future<String> passwordReset(email) {
    return null;
  }
}
