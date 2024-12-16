import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_clean_code/data/exceptions/app_exceptions.dart';
import 'package:bloc_clean_code/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices implements BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);
      return jsonResponse;
    } on SocketException {
      throw NoInternetException('No Internet');
    } on TimeoutException {
      throw RequestTimeOutException('Time out try again');
    }
  }

  @override
  Future<dynamic> postApi(String url, var data) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);
      return jsonResponse;
    } on SocketException {
      throw NoInternetException('No Internet');
    } on TimeoutException {
      throw RequestTimeOutException('Time out try again');
    }
  }
}

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    case 400:
      dynamic jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    case 401:
      throw UnauthourisedException('');
    case 500:
      throw FetchDataException('Error Communicating with server');
  }
}
