part of 'countries_bloc.dart';

abstract class CountriesEvent {
  const CountriesEvent();
}

class GetCountries extends CountriesEvent {
  final CountriesServices countriesServices;
  GetCountries({required this.countriesServices});
}
