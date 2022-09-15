import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:your_ip/models/ip_model.dart';

class IPServices {
  Future<IpModel> getIp() async {
    Uri url = Uri.parse('https://api.myip.com/');
    http.Response response = await http.get(url);

    if (response.statusCode == 400) {
      //var data = jsonDecode(response.body);
      throw Exception('error');
    }
    Map<String, dynamic> data = jsonDecode(response.body);

    IpModel ip = IpModel.fromJson(data);

    return ip;
  }
}
