import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static Future<http.Response> encryptionAndDecryption(
      {required String text,
      required key,
      required bool isencrypt,
      required algorithm}) async {
    String technique = isencrypt ? 'encrypt' : 'decrypt';
    // String apiUrl = 'http://127.0.0.1:5000/$technique/$algorithm';
    String apiUrl =
        'http://mohammedezz.pythonanywhere.com/$technique/$algorithm';
    final Map<String, dynamic> requestData = algorithm == 'caesar'
        ? {
            'text': text,
            'shift': int.parse(key),
          }
        : {
            'text': text,
            'key': key,
          };
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestData),
    );
    return response;
  }
}
