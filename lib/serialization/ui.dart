import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:yx_sirius_networkin/http/requester.dart';

class SerializationUi extends StatefulWidget {
  const SerializationUi({Key? key}) : super(key: key);

  @override
  _SerializationUitate createState() => _SerializationUitate();
}

class _SerializationUitate extends State<SerializationUi> {
  final HttpRequester _requester = HttpRequester();
  Map<String, dynamic>? _data;
  Response? _response;

  Future<void> _makeRequest() async {
    final response = await _requester.getIpJson();
    final data = jsonDecode(response.body);
    setState(() {
      _response = response;
      _data = data;
    });
  }

  void _clear() {
    setState(() {
      _response = null;
      _data = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.headline5;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Serialization'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(12),
              color: Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text('Status Code:', style: headerStyle),
                  Text('${_response?.statusCode}'),
                  const Spacer(),
                  Text('Body:', style: headerStyle),
                  Text('${_response?.body}'),
                  const Spacer(),
                  Text('Ip:', style: headerStyle),
                  Text('${_data?['ip']}'),
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
