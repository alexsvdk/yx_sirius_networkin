import 'package:dio/dio.dart';

import 'models/ip.dart';

class DioJsonRequester {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.ipify.org',
    ),
  );

  Future<IpResponseModel> getIpModel() async {
    final response = await _dio
        .get<Map<String, dynamic>>('/', queryParameters: {'format': 'json'});
    return IpResponseModel.fromJson(response.data!);
  }
}
