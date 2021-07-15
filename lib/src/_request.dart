import "package:http/http.dart" as http;

Future<String> requestHandler(String url) async {
  final r = await http.get(Uri.parse(url));

  if (r.statusCode == 200) {
    return r.body;
  } else {
    throw Exception("Request to $url has failed");
  }
}
