import 'dart:convert';

import 'package:outshadedm/provider/userprovider.dart';

import '../models/user.dart';

class UserRepository {
  final UserProvider userProvider;
  UserRepository({required this.userProvider});
  Future<List<User>> getUsers() async {
    var response = await userProvider.fetchUser();
    List<dynamic> jsondata = jsonDecode(response);
    List<User> users = List<User>.from(jsondata.first['users']
        .map((e) => User(name: e["name"], atype: e['atype'], id: e['id'])));
    return users;
  }
}
