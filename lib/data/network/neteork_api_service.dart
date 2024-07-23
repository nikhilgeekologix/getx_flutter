import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:getx_example/data/AppExceptions.dart';

import 'base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic jsonResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeOut {
      throw RequestTimeOut();
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }
    dynamic jsonResponse;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeOut {
      throw RequestTimeOut();
    }
    print(jsonResponse);
    return jsonResponse;
  }

  returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException(
            'Error accord while communicating with server ${response.statusCode}');
    }
  }
}
