import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:your_ip/core/basics_widgets/error_message.dart';
import 'package:your_ip/core/basics_widgets/generic_loader.dart';
import 'package:your_ip/features/countries/blocs/countries_bloc.dart';
import 'package:your_ip/features/countries/models/countries_model.dart';
import 'package:your_ip/features/countries/views/widgets/country_item.dart';
import 'package:your_ip/features/countries/repositories/countries_service.dart';

class AllCountries extends StatelessWidget {
  List<CountriesModel>? countriesModelList;

  AllCountries({Key? key, required this.countriesModelList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountriesBloc()
        ..add(GetCountries(countriesServices: CountriesServices())),
      child: BlocBuilder<CountriesBloc, CountriesState>(
        builder: (context, state) {
          if (state is CountriesLoading) {
            return const Center(
              child: GenericLoader(),
            );
          } else if (state is CountriesSuccess) {
            countriesModelList = state.countriesModel;
            return AnimationLimiter(
              child: ListView.builder(
                itemCount: countriesModelList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: CountryItem(
                          countriesModel: countriesModelList![index],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is CountriesFailure) {
            return const ErrorMessage(
              message: 'Something went wrong, Please try again',
            );
          } else {
            return const GenericLoader();
          }
        },
      ),
    );
  }
}
