import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yx_sirius_networkin/dio/ui.dart';
import 'package:yx_sirius_networkin/http/ui.dart';
import 'package:yx_sirius_networkin/json_serializable/ui.dart';
import 'package:yx_sirius_networkin/serialization/ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const Menue(),
    );
  }
}

class Menue extends StatelessWidget {
  const Menue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Flutter Networking'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(),
              MaterialButton(
                minWidth: double.infinity,
                color: Colors.blue.shade500,
                textColor: Colors.white,
                onPressed: () => Navigator.push(context,
                    CupertinoPageRoute(builder: (_) => const HttpUi())),
                child: const Text('http'),
              ),
              MaterialButton(
                minWidth: double.infinity,
                color: Colors.green.shade500,
                textColor: Colors.white,
                onPressed: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (_) => const SerializationUi())),
                child: const Text('serialization'),
              ),
              MaterialButton(
                minWidth: double.infinity,
                color: Colors.blue.shade500,
                textColor: Colors.white,
                onPressed: () => Navigator.push(
                    context, CupertinoPageRoute(builder: (_) => const DioUi())),
                child: const Text('dio'),
              ),
              MaterialButton(
                minWidth: double.infinity,
                color: Colors.green.shade500,
                textColor: Colors.white,
                onPressed: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (_) => const JsonSerializableUi())),
                child: const Text('json_serializable'),
              ),
              const Spacer(),
              const Text(
                'Сириус 2021',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
