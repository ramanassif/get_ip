import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_ip/core/theme/theme.dart';
import 'package:your_ip/core/animation/animate_route.dart';
import 'package:your_ip/features/countries/models/countries_model.dart';
import 'package:your_ip/features/countries/views/country_information.dart';
import 'package:your_ip/features/get_ip/blocs/country_bloc/country_bloc.dart';
import 'package:your_ip/features/get_ip/repositories/country_services.dart';

class CountryItem extends StatefulWidget {
  final CountriesModel countriesModel;
  const CountryItem({Key? key,required this.countriesModel}) : super(key: key);

  @override
  State<CountryItem> createState() => _CountryItemState();
}

class _CountryItemState extends State<CountryItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(AnimationEffects(page: const CountryInformation()));
        //Navigator.pushNamed(context, CountryInformation.routeName);
        BlocProvider.of<CountryBloc>(context).add(GetCountryInformation(
            countryServices: CountryServices(), cc: widget.countriesModel.cc));
      },
      child: Card(
        color: secondClr.withOpacity(0.3),
        child: ListTile(
          title: Text(
            widget.countriesModel.nativeNameEn,
            style: const TextStyle(color: Colors.black),
          ),
          trailing: Image.network(
            widget.countriesModel.flag,
            width: 50,
          ),
        ),
      ),
    );
  }
}
