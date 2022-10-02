import 'package:your_ip/core/api_services/api_services.dart';
import 'package:your_ip/core/api_services/url.dart';
import 'package:your_ip/features/get_ip/models/country_model.dart';

class CountryServices {
  Future<CountryModel> getCountryInfo(String cc) async {
    List<dynamic> data =
        await ApiServices(baseUrl: countryUrl+cc, numOfApi: 1).getFromApi();
    CountryModel countryInfo = CountryModel.fromJson(data);

    return countryInfo;
  }
}
