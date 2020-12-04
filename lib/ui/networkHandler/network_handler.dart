import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  String baseUrl = 'http://10.0.2.2:9000';

  FlutterSecureStorage _storage = FlutterSecureStorage();

  final log = Logger();

  Future<http.Response> post(String url, body) async {
    final token = _storage.read(key: 'token');
    url = formatter(url);

    final res = await http.post(url,
        headers: {
          "content-type": "application/json",
          "cookie": "w_auth=$token"
        },
        body: body);

    log.i(res);
    log.i(res.body);

    return res;
  }

  Future get(String url) async {
    url = formatter(url);
    String token = await _storage.read(key: "token");
    print(token);

    final res = await http.get(url, headers: {
      "Content-type": "application/json",
      "Cookie": "w_auth=$token"
    });

    print(res.body);
    log.i(res);
    log.d(res.body);

    return json.decode(res.body);
  }

  String formatter(String url) {
    return baseUrl + url;
  }

  NetworkImage getImage(String filePath) {
    String url = formatter('//$filePath');
    return NetworkImage(url);
  }
}
