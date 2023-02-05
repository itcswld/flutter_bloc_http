import 'dart:convert';

import 'package:flutter_bloc_http/Model/UserModel.dart';
import 'package:http/http.dart';

class UserRepos {
  String endUrl = 'http://reqres.in/api/users?page=2';
  Future<List<UserModel>> getUsers() async {
    Response resp = await get(Uri.parse(endUrl));
    if (resp.statusCode == 200) {
      final List result = jsonDecode(resp.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(resp.reasonPhrase);
    }
  }
}
