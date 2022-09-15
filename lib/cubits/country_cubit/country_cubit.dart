import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_ip/cubits/country_cubit/country_state.dart';
import 'package:your_ip/models/country_model.dart';
import 'package:your_ip/services/country_services.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit(this.countryServices) : super(CountryInitial());
  CountryServices countryServices;
  CountryModel? countryModel;

  void getCountryInfo() async {
    emit(CountryLoading());
    try {
      countryModel = await countryServices.getCountryInfo();
      emit(CountrySuccess(countryModel: countryModel!));
    } on Exception catch (e) {
      print(e);
      emit(CountryFailure());
    }
  }
}
