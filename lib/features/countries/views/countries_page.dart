import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:your_ip/core/animation/animateroute.dart';
import 'package:your_ip/core/theme/theme.dart';
import 'package:your_ip/core/theme/theme_services.dart';
import 'package:your_ip/features/countries/blocs/countries_bloc.dart';
import 'package:your_ip/features/countries/models/countries_model.dart';
import 'package:your_ip/features/countries/repositories/countries_service.dart';
import 'package:your_ip/features/countries/views/country_information.dart';
import 'package:your_ip/features/get_ip/blocs/country_bloc/country_bloc.dart';
import 'package:your_ip/features/get_ip/repositories/country_services.dart';
import 'package:your_ip/features/search/blocs/search_countries_bloc.dart';
import 'package:your_ip/features/search/repositories/search_service.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({Key? key}) : super(key: key);

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  List<CountriesModel>? countriesModelList;
  List<CountriesModel>? searchCountriesModelList;
  bool isSearching = false;
  TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching ? searchTextField() : appBarTitle(),
        actions: buildAppBarSearch(),
        backgroundColor: firstClr,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24,right: 24,top: 24),
        child: !isSearching ? allCountries() : searchResult(),
      ),
    );
  }

  Widget allCountries() {
    return BlocProvider(
      create: (context) => CountriesBloc()
        ..add(GetCountries(countriesServices: CountriesServices())),
      child: BlocBuilder<CountriesBloc, CountriesState>(
        builder: (context, state) {
          if (state is CountriesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CountriesSuccess) {
            countriesModelList = state.countriesModel;
            return ListView.builder(
              itemCount: countriesModelList!.length,
              itemBuilder: (BuildContext context, int index) {
                return countryItem(countriesModelList![index]);
              },
            );
          } else if (state is CountriesFailure) {
            return const Center(
              child: Text('Something went wrong, Please try again'),
            );
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'there is no Countries',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget searchResult() {
    return BlocBuilder<SearchCountriesBloc, SearchCountriesState>(
        builder: (context, state) {
      if (state is SearchCountriesLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is SearchCountriesSuccess) {
        searchCountriesModelList = state.countriesModel;
        return ListView.builder(
          itemCount: searchCountriesModelList!.length,
          itemBuilder: (BuildContext context, int index) {
            return countryItem(searchCountriesModelList![index]);
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

  Widget countryItem(CountriesModel countriesModel) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(AnimationEffects(page: const CountryInformation()));
        //Navigator.pushNamed(context, CountryInformation.routeName);
        BlocProvider.of<CountryBloc>(context).add(GetCountryInformation(
            countryServices: CountryServices(), cc: countriesModel.cc));
      },
      child: Card(
        color: fourthColor,
        child: ListTile(
          title: Text(
            countriesModel.nativeNameEn,
            style: const TextStyle(color: Colors.black),
          ),
          trailing: Image.network(
            countriesModel.flag,
            width: 50,
          ),
        ),
      ),
    );
  }

  Widget searchTextField() {
    return TextField(
      controller: searchTextController,
      cursorColor: Colors.grey,
      decoration: const InputDecoration(
        hintText: 'Find a Country..',
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintStyle: TextStyle(
          color: fiveColor,
          fontSize: 18,
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      onChanged: (searchedCountry) {
        BlocProvider.of<SearchCountriesBloc>(context).add(GetSearchCountries(
            searchCountriesServices:
                SearchCountriesServices(restOfUrl: searchedCountry)));
        //addSearchedCountryToSearchedList(searchedCountry);
      },
    );
  }

  // void addSearchedCountryToSearchedList(String searchedCountry) {
  //   searchCountriesModelList = countriesModelList!
  //       .where((country) =>
  //           country.nativeNameEn.toLowerCase().startsWith(searchedCountry))
  //       .toList();
  //   setState(() {});
  // }

  List<Widget> buildAppBarSearch() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: fourthColor,
          ),
        ),
        IconButton(
          onPressed: () {
            Provider.of<ThemeServices>(context, listen: false).toggleMode();
          },
          icon: Provider.of<ThemeServices>(context).mode == ThemeMode.dark
              ? const Icon(
                  Icons.wb_sunny_outlined,
                  color: fourthColor,
                )
              : const Icon(
                  Icons.nightlight_round_outlined,
                  color: fourthColor,
                ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: startSearch,
          icon: const Icon(
            Icons.search,
            color: fourthColor,
          ),
        ),
        IconButton(
          onPressed: () {
            Provider.of<ThemeServices>(context, listen: false).toggleMode();
          },
          icon: Provider.of<ThemeServices>(context).mode == ThemeMode.dark
              ? const Icon(
                  Icons.wb_sunny_outlined,
                  color: fourthColor,
                )
              : const Icon(
                  Icons.nightlight_round_outlined,
                  color: fourthColor,
                ),
        ),
      ];
    }
  }

  void startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearching() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    setState(() {
      searchTextController.clear();
    });
  }

  Widget appBarTitle() {
    return const Text(
      'All Countries',
      style: TextStyle(color: fourthColor),
    );
  }
}
