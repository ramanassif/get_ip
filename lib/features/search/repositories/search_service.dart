import 'package:your_ip/core/api_services/api_services.dart';
import 'package:your_ip/core/api_services/url.dart';
import 'package:your_ip/features/countries/models/countries_model.dart';

class SearchCountriesServices {
  String restOfUrl;
  SearchCountriesServices({required this.restOfUrl});
  Future<List<CountriesModel>> searchGetCountriesInfo() async {
    List<dynamic> data =
        await ApiServices(baseUrl: searchUrl+restOfUrl, numOfApi: 1).getFromApi();
    //var countryInfo = CountriesModel.fromJson(data);
    return data.map((e) => CountriesModel.fromJson(e)).toList();
  }
}
