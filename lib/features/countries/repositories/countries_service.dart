import 'package:your_ip/core/api_services/api_services.dart';
import 'package:your_ip/core/api_services/url.dart';
import 'package:your_ip/features/countries/models/countries_model.dart';

class CountriesServices {
  Future<List<CountriesModel>> getCountriesInfo() async {
    List<dynamic> data =
    await ApiServices(baseUrl: countriesUrl, numOfApi: 1).getFromApi();
    //var countryInfo = CountriesModel.fromJson(data);
    return data.map((e) => CountriesModel.fromJson(e)).toList();
  }
}
