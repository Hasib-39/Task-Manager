import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


class NetworkResponse{
  final int statusCode;
  final Map<String, dynamic>? responseData;
  final bool isSuccess;
  final String? errorMessage;

  NetworkResponse({
    required this.statusCode,
    required this.isSuccess,
    this.responseData,
    this.errorMessage,
  });
}
class NetworkCaller{
  static Future<NetworkResponse> getRequest({required String url, Map<String, dynamic>? params}) async{
    try{
      Uri uri = Uri.parse(url);
      debugPrint('URL => $url');
      Response response = await get(uri);
      debugPrint('Response Code => ${response.statusCode}');
      debugPrint('Response Data => ${response.body}');
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: true,
            responseData: decodedResponse);
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e){
      return NetworkResponse(statusCode: -1, isSuccess: false, errorMessage: e.toString());
    }
  }
}