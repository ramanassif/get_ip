part of 'countries_bloc.dart';

abstract class CountriesState {}

class CountriesInitial extends CountriesState {}

class CountriesLoading extends CountriesState {}

class CountriesSuccess extends CountriesState {
  List<CountriesModel> countriesModel;
  CountriesSuccess({required this.countriesModel});
}

class CountriesFailure extends CountriesState {}
