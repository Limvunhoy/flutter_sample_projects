import 'dart:convert';
import 'dart:io';

import 'package:getx_sample/getx/constant/api_constant.dart';
import 'package:getx_sample/getx/core/app_exception/app_exception.dart';
import 'package:http/http.dart' as http;

class BaseApiHelper {
  final String _baseUrl = "https://newsapi.org";

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var jsonResponse = json.decode(response.body.toString());
        print(jsonResponse);
        return jsonResponse;
      case 400:
        throw BadRequestException(response.body.toString());
        break;
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            "Error occurred while communication with Server with StatusCode: ${response.statusCode}");
    }
  }

  Future<dynamic> get(String url) async {
    var jsonResponse;
    try {
      final response = await http.get(_baseUrl + url,
          headers: {"Authorization": "Bearer ${ApiConstant.API_KEY}"});
      jsonResponse = _returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return jsonResponse;
  }

  Future<dynamic> post(String url, dynamic body) async {
    print("Api Post, url: $url");
    var jsonResponse;
    try {
      final response = await http.post(_baseUrl + url, body: body);
      jsonResponse = _returnResponse(response);
    } on SocketException {
      print("No Internet Connection");
      throw FetchDataException("No Internet Connection");
    }

    return jsonResponse;
  }

  Future<dynamic> put(String url, dynamic body) async {
    print("Api put, url: $url");
    var jsonResponse;
    try {
      final response = await http.put(_baseUrl + url, body: body);
      jsonResponse = _returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    print("Api put");
    print("Response: ${jsonResponse.toString()}");
    return jsonResponse;
  }

  Future<dynamic> delete(String url) async {
    print("Api delete, url: $url");
    var jsonResponse;
    try {
      final response = await http.delete(_baseUrl + url);
      jsonResponse = _returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return jsonResponse;
  }
}
