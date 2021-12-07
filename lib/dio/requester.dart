import 'package:dio/dio.dart';
import 'package:http/src/response.dart';
import 'package:yx_sirius_networkin/http/requester.dart';
import 'package:yx_sirius_networkin/json_serializable/models/ip.dart';

class DioRequester {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.ipify.org',
    ),
  );

  Future<Map<String, dynamic>?> getIpJson() async {
    final response = await _dio
        .get<Map<String, dynamic>>('/', queryParameters: {'format': 'json'});
    return response.data;
  }
}
