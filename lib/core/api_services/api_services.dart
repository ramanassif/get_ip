import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl;
  final int numOfApi;

  ApiServices({required this.baseUrl, required this.numOfApi});

  Future getFromApi() async {
    Uri url = Uri.parse(baseUrl);
    http.Response response = await http.get(url);

    if (response.statusCode == 400) {
      throw Exception('error');
    }
    if (numOfApi == 1) {
      List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    } else if(numOfApi == 2){
      Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    } else {
      List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    }
  }
}
