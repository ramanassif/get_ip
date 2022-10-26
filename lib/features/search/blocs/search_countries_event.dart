part of 'search_countries_bloc.dart';

abstract class SearchCountriesEvent {
  const SearchCountriesEvent();
}

class GetSearchCountries extends SearchCountriesEvent {
  final SearchCountriesServices searchCountriesServices;

  GetSearchCountries({required this.searchCountriesServices});
}
