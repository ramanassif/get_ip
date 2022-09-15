import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:your_ip/models/country_model.dart';

class CountryServices {
  Future<CountryModel> getCountryInfo() async {
    Uri url = Uri.parse('https://restcountries.com/v3.1/alpha/sy');
    http.Response response = await http.get(url);

    if (response.statusCode == 400) {
      //var data = jsonDecode(response.body);
      throw Exception('error');
    }
    List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
    //data.map((value) => CountryModel.fromJson(value)).toList();

    CountryModel countryInfo = CountryModel.fromJson(data);

    return countryInfo;
  }
}
