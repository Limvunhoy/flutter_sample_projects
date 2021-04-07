import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_sample_project/model/user/user_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProvider extends ChangeNotifier {
  List<UserResponse> users = [];
  bool _isLoading = false;

  String _baseUrl = "https://jsonplaceholder.typicode.com/users";

  bool get loading => _isLoading;

  Future fetchUsers() async {
    _isLoading = true;
    var response = await http.get(_baseUrl);
    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      users = jsonData.map((json) => UserResponse.fromJson(json)).toList();

      _isLoading = false;
      notifyListeners();
    } else {
      print("Can not get users");
    }
  }
}
