import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sample_project/models/photo_model.dart';
import 'package:http/http.dart' as http;

class FetchPhotoService with ChangeNotifier {
  List<PhotoResponse> photos = [];

  Future<List<PhotoResponse>> fetchPhoto() async {
    String url = "https://jsonplaceholder.typicode.com/photos";
    var response = await http.get(url);

    if (response.statusCode <= 200) {
      List jsonData = json.decode(response.body);
      photos = jsonData.map((e) => PhotoResponse.fromJson(e)).toList();
      notifyListeners();

      return photos;
    } else {
      print("Fetch Photo Failed");
    }
  }
}
