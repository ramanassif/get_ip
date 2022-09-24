import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl;
  final bool i;

  ApiServices({required this.baseUrl, required this.i});

  Future getFromApi() async {
    Uri url = Uri.parse(baseUrl);
    http.Response response = await http.get(url);

    if (response.statusCode == 400) {
      throw Exception('error');
    }
    if (i) {
      List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    } else {
      Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    }
  }
}
