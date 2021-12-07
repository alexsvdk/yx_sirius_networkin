import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:yx_sirius_networkin/dio/requester.dart';
import 'package:yx_sirius_networkin/http/requester.dart';

class DioUi extends StatefulWidget {
  const DioUi({Key? key}) : super(key: key);

  @override
  _DioUitate createState() => _DioUitate();
}

class _DioUitate extends State<DioUi> {
  final DioRequester _requester = DioRequester();
  Map<String, dynamic>? _data;

  Future<void> _makeRequest() async {
    final data = await _requester.getIpJson();
    setState(() {
      _data = data;
    });
  }

  void _clear() {
    setState(() {
      _data = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.headline5;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio'),
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
                  Text('Body:', style: headerStyle),
                  Text('$_data'),
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
