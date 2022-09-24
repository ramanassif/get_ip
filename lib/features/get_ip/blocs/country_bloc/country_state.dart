part of 'country_bloc.dart';

abstract class CountryState {}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountrySuccess extends CountryState {
  CountryModel countryModel;
  CountrySuccess({required this.countryModel});
}

class CountryFailure extends CountryState {}
