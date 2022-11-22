import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_ip/core/basics_widgets/generic_loader.dart';
import 'package:your_ip/features/countries/models/countries_model.dart';
import 'package:your_ip/features/search/blocs/search_countries_bloc.dart';
import 'package:your_ip/features/countries/views/widgets/country_item.dart';

class SearchResult extends StatelessWidget {
  List<CountriesModel>? searchCountriesModelList;

  SearchResult({Key? key, required this.searchCountriesModelList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCountriesBloc, SearchCountriesState>(
        builder: (context, state) {
      if (state is SearchCountriesLoading) {
        return const Center(
          child: GenericLoader(),
        );
      } else if (state is SearchCountriesSuccess) {
        searchCountriesModelList = state.countriesModel;
        return ListView.builder(
          itemCount: searchCountriesModelList!.length,
          itemBuilder: (BuildContext context, int index) {
            return CountryItem(
                countriesModel: searchCountriesModelList![index]);
          },
        );
      } else if (state is SearchCountriesFailure) {
        return const Center(
          child: Text('Something went wrong, Please try again'),
        );
      } else {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Searching..',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}
