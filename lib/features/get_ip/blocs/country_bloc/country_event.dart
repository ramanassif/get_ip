part of 'country_bloc.dart';

abstract class CountryEvent {
  const CountryEvent();
}

class GetCountryInformation extends CountryEvent {
  final CountryServices countryServices;
  final String cc;
  GetCountryInformation({required this.countryServices, required this.cc});
}
