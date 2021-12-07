import 'package:flutter/material.dart';
import 'package:yx_sirius_networkin/json_serializable/models/ip.dart';
import 'package:yx_sirius_networkin/json_serializable/requester.dart';

class JsonSerializableUi extends StatefulWidget {
  const JsonSerializableUi({Key? key}) : super(key: key);

  @override
  _JsonSerializableUiState createState() => _JsonSerializableUiState();
}

class _JsonSerializableUiState extends State<JsonSerializableUi> {
  final _requester = DioJsonRequester();
  IpResponseModel? _response;

  Future<void> _makeRequest() async {
    final response = await _requester.getIpModel();
    setState(() {
      _response = response;
    });
  }

  void _clear() {
    setState(() {
      _response = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.headline5;
    return Scaffold(
      appBar: AppBar(
        title: const Text('json_serializable'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(12),
              color: _response?.color ?? Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text('Raw Json:', style: headerStyle),
                  Text('${_response?.toJson()}'),
                  const Spacer(),
                  Text('Ip:', style: headerStyle),
                  Text('${_response?.ip}'),
                  const Spacer(),
                  Text('Color:', style: headerStyle),
                  Text('${_response?.color}'),
                  const Spacer(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: MaterialButton(
              minWidth: double.infinity,
              color: Colors.green.shade500,
              textColor: Colors.white,
              onPressed: _makeRequest,
              child: const Text('Make request'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: MaterialButton(
              minWidth: double.infinity,
              color: Colors.blue.shade500,
              textColor: Colors.white,
              onPressed: _clear,
              child: const Text('Clear'),
            ),
          ),
        ],
      )),
    );
  }
}
