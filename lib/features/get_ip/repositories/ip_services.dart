import 'package:your_ip/core/api_services/api_services.dart';
import 'package:your_ip/features/get_ip/models/ip_model.dart';

class IPServices {
  Future<IpModel> getIp() async {
    Map<String, dynamic> data =
        await ApiServices(baseUrl: 'https://api.myip.com/', i: false)
            .getFromApi();

    IpModel ip = IpModel.fromJson(data);

    return ip;
  }
}
