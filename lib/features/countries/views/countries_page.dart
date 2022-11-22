import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:your_ip/core/theme/theme.dart';
import 'package:your_ip/core/theme/theme_services.dart';
import 'package:your_ip/features/countries/models/countries_model.dart';
import 'package:your_ip/features/search/blocs/search_countries_bloc.dart';
import 'package:your_ip/features/search/repositories/search_service.dart';
import 'package:your_ip/features/countries/views/widgets/all_countries.dart';
import 'package:your_ip/features/countries/views/widgets/app_bar_title.dart';
import 'package:your_ip/features/countries/views/widgets/search_result.dart';

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
        title: isSearching ? searchTextField() : const AppBarTitle(),
        iconTheme: const IconThemeData(color: fourthColor),
        actions: buildAppBarSearch(),
        backgroundColor: firstClr,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
        child: !isSearching
            ? AllCountries(
                countriesModelList: countriesModelList,
              )
            : SearchResult(searchCountriesModelList: searchCountriesModelList),
      ),
    );
  }

  Widget searchTextField() {
    return TextField(
      controller: searchTextController,
      cursorColor: Colors.grey.withOpacity(0.4),
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
}
