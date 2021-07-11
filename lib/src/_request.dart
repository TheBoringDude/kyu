import 'dart:convert';

import "package:http/http.dart" as http;

Future<Map<String, dynamic>> requestHandler(String url) async {
  final r = await http.get(Uri.parse(url));

  if (r.statusCode == 200) {
    return jsonDecode(r.body);
  } else {
    throw Exception("Request to $url has failed");
  }
}
