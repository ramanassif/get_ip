import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_ip/core/theme/theme.dart';
import 'package:your_ip/core/basics_widgets/error_message.dart';
import 'package:your_ip/core/basics_widgets/flag_container.dart';
import 'package:your_ip/core/basics_widgets/generic_loader.dart';
import 'package:your_ip/core/storage_services/storage_service.dart';
import 'package:your_ip/features/get_ip/blocs/country_bloc/country_bloc.dart';
import 'package:your_ip/features/get_ip/models/country_model.dart';

class CountryInformation extends StatefulWidget {
  static String routeName = '/country_information';

  const CountryInformation({Key? key}) : super(key: key);

  @override
  State<CountryInformation> createState() => _CountryInformationState();
}

class _CountryInformationState extends State<CountryInformation> {
  CountryModel? countryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstClr,
        title: const Text(
          "Country's information",
          style: TextStyle(color: fourthColor),
        ),
        iconTheme: const IconThemeData(color: fourthColor),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: fourthColor,
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: BlocBuilder<CountryBloc, CountryState>(
                builder: (context, state) {
                  if (state is CountryLoading) {
                    return const Center(
                      child: GenericLoader(),
                    );
                  } else if (state is CountrySuccess) {
                    countryModel = state.countryModel;
                    StorageServices.write(
                        'NativeNameEn', countryModel!.nativeNameEn);
                    StorageServices.write('flag', countryModel!.flag);
                    return SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: secondClr,
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: Center(
                                      child: Text(
                                        countryModel!.nativeNameEn,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              FlagAnimation(flag: countryModel!.flag),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Country Name:',
                            style: TextStyle(
                                color: secondClr,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          Text(
                            countryModel!.countryName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Capital:',
                            style: TextStyle(
                                color: secondClr,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          Text(
                            countryModel!.capital,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Native Name:',
                            style: TextStyle(
                                color: secondClr,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          Text(
                            countryModel!.nativeNameAr,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    );
                  } else if (state is CountryFailure) {
                    return const ErrorMessage(
                      message: 'Something went wrong, Please try again',
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          ErrorMessage(
                            message: 'Refresh Failed',
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
