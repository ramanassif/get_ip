import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_ip/features/get_ip/models/country_model.dart';
import 'package:your_ip/features/get_ip/models/ip_model.dart';
import 'package:your_ip/features/get_ip/repositories/country_services.dart';

part 'country_event.dart';

part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc(this.countryServices) : super(CountryInitial());
  CountryServices countryServices;
  CountryModel? countryModel;
  IpModel? ipModel;

  void getCountryInfo(String cc) async {
    emit(CountryLoading());
    try {
      countryModel = await countryServices.getCountryInfo(cc);
      emit(CountrySuccess(countryModel: countryModel!));
    } on Exception catch (e) {
      print(e);
      emit(CountryFailure());
    }
  }
}
