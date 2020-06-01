import 'dart:convert';
import 'dart:io';

import 'package:flutter_repo/data/base_url.dart';
import 'package:flutter_repo/data/token_repository.dart';
import 'package:flutter_repo/models/auth-user.dart';
import 'package:http/http.dart' as http;

abstract class UserAbstractRepository {
  Future<AuthUser> getUser();
}

class UserRepository implements UserAbstractRepository {
  
  final TokenRepository tokenRepository = TokenRepository();

  @override
  Future<AuthUser> getUser() async {
    var token = await tokenRepository.getToken();

    final response = await http.get(
      '$baseUrl/user',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return AuthUser.fromJson(data);
    } else {
      throw new Exception('User Could Not Be Found');
    }
  }
}
