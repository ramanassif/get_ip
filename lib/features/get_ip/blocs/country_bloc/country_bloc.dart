import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_ip/features/get_ip/models/country_model.dart';
import 'package:your_ip/features/get_ip/repositories/country_services.dart';

part 'country_event.dart';

part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(CountryInitial());


  @override
  Stream<CountryState> mapEventToState(CountryEvent event) async* {
    if (event is GetCountryInformation) {
      yield CountryLoading();
      try {
        var countryModel = await event.countryServices.getCountryInfo(event.cc);
        yield (CountrySuccess(countryModel: countryModel));
      } on Exception catch (e) {
        print(e);
        yield (CountryFailure());
      }
    }
  }
}
