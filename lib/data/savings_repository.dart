import 'dart:convert';
import 'dart:io';

import 'package:flutter_repo/data/base_url.dart';
import 'package:flutter_repo/data/token_repository.dart';
import 'package:flutter_repo/models/savings_category.dart';
import 'package:http/http.dart' as http;

abstract class SavingsAbstractRepo {

  Future<List<SavingsCategory>> getSavingsCategory();

}

class SavingsRepository extends SavingsAbstractRepo {
  final TokenRepository tokenRepository = TokenRepository();
  
  
  
  @override
  Future<List<SavingsCategory>> getSavingsCategory() async {
    var token = await tokenRepository.getToken();

    final response = await http.get(
      '$baseUrl/user/savings-category',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );

      if (response.statusCode == 200) {
         var data = json.decode(response.body);

        List<SavingsCategory> categoryList = data['savingsCategory'].map<SavingsCategory>((json) {
            return SavingsCategory.fromJson(json);
        }).toList();
        return categoryList;
      } else {
        throw new Exception("Couldn't get any saving categories");
      }

  }


}