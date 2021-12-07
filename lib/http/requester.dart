import 'package:http/http.dart' as http;

class HttpRequester {
  Future<http.Response> getIp() async =>
      http.get(Uri.parse('https://api.ipify.org'));

  Future<http.Response> getIpJson() async =>
      http.get(Uri.parse('https://api.ipify.org?format=json'));
}
