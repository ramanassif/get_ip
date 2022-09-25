import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl;
  final bool isUTF8;

  ApiServices({required this.baseUrl, required this.isUTF8});

  Future getFromApi() async {
    Uri url = Uri.parse(baseUrl);
    http.Response response = await http.get(url);

    if (response.statusCode == 400) {
      throw Exception('error');
    }
    if (isUTF8) {
      List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    } else {
      Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    }
  }
}
