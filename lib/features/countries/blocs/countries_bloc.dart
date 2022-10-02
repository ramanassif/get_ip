import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_ip/features/countries/models/countries_model.dart';
import 'package:your_ip/features/countries/repositories/countries_service.dart';

part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  CountriesBloc() : super(CountriesInitial());

  @override
  Stream<CountriesState> mapEventToState(CountriesEvent event) async* {
    if (event is GetCountries) {
      yield CountriesLoading();
      try {
        List<CountriesModel> countriesModel = await event.countriesServices.getCountriesInfo();
        yield (CountriesSuccess(countriesModel: countriesModel));
      } on Exception catch (e) {
        print(e);
        yield (CountriesFailure());
      }
    }
  }
}
