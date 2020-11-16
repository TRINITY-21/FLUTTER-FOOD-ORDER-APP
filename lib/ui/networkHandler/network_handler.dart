import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  String baseUrl = 'http://10.0.3.2:3000';

  final log = Logger();

  Future<http.Response> post(String url, body) async {
    url = formatter(url);

    final res = await http.post(url,
        headers: {"content-type": "application/json"}, body: body);

    log.i(res);
    log.i(res.body);

    return res;
  }

  Future get(String url) async {
    url = formatter(url);

    final res =
        await http.get(url, headers: {'content-type': "application/json"});

    log.d(res.body);
    return json.decode(res.body);
  }

  String formatter(String url) {
    return baseUrl + url;
  }
}
