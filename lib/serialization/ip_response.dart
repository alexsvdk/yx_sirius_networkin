class IpResponse {
  final String ip;

  IpResponse(this.ip);

  factory IpResponse.fromJson(Map<String, dynamic> json) =>
      IpResponse(json['ip']);
}
