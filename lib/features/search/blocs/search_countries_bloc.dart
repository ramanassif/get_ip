import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:your_ip/features/countries/models/countries_model.dart';
import 'package:your_ip/features/search/repositories/search_service.dart';

part 'search_countries_event.dart';

part 'search_countries_state.dart';

class SearchCountriesBloc
    extends Bloc<SearchCountriesEvent, SearchCountriesState> {
  SearchCountriesBloc() : super(SearchCountriesInitial());

  @override
  Stream<Transition<SearchCountriesEvent, SearchCountriesState>>
      transformEvents(
          Stream<SearchCountriesEvent> events,
          TransitionFunction<SearchCountriesEvent, SearchCountriesState>
              transitionFn) {
    return events.switchMap(transitionFn);
  }

  @override
  Stream<SearchCountriesState> mapEventToState(
      SearchCountriesEvent event) async* {
    if (event is GetSearchCountries) {
      yield SearchCountriesLoading();
      try {
        List<CountriesModel> countriesModel =
            await event.searchCountriesServices.searchGetCountriesInfo();
        yield (SearchCountriesSuccess(countriesModel: countriesModel));
      } on Exception catch (e) {
        print(e);
        yield (SearchCountriesFailure());
      }
    }
  }
}
