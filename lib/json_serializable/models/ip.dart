import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ip.g.dart';

@JsonSerializable()
class IpResponseModel {
  final String ip;

  IpResponseModel(this.ip);

  Color get color {
    final ints = ip.split('.').map((e) => int.parse(e)).toList();
    return Color.fromARGB(ints[0], ints[1], ints[2], ints[3]);
  }

  factory IpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$IpResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$IpResponseModelToJson(this);
}
