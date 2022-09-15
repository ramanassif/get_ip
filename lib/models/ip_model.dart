class IpModel {
  final String ip;
  final String country;

  IpModel({
    required this.ip,
    required this.country,
  });

  factory IpModel.fromJson(dynamic data) {
    return IpModel(
      ip: data['ip'],
      country: data['country'],
    );
  }
}
