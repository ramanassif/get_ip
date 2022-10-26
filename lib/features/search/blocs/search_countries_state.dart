part of 'search_countries_bloc.dart';

abstract class SearchCountriesState {}

class SearchCountriesInitial extends SearchCountriesState {}

class SearchCountriesLoading extends SearchCountriesState {}

class SearchCountriesSuccess extends SearchCountriesState {
  List<CountriesModel> countriesModel;

  SearchCountriesSuccess({required this.countriesModel});
}

class SearchCountriesFailure extends SearchCountriesState {}
