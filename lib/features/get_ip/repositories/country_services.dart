import 'package:your_ip/core/api_services/api_services.dart';
import 'package:your_ip/features/get_ip/models/country_model.dart';

class CountryServices {
  Future<CountryModel> getCountryInfo(String cc) async {
    List<dynamic> data = await ApiServices(
            baseUrl: 'https://restcountries.com/v3.1/alpha/$cc', i: true)
        .getFromApi();
    CountryModel countryInfo = CountryModel.fromJson(data);

    return countryInfo;
  }
}
