class IpModel {
  final String ip;
  final String country;
  final String cc;

  IpModel({
    required this.ip,
    required this.country,
    required this.cc,
  });

  factory IpModel.fromJson(dynamic data) {
    return IpModel(
      ip: data['ip'],
      country: data['country'],
      cc: data['cc'],
    );
  }

}
