import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:your_ip/core/storage_services/storage_service.dart';
import 'package:your_ip/core/theme/theme_services.dart';
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
        title: const Text('Information'),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.grey
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              decoration: BoxDecoration(
                color: Provider.of<ThemeServices>(context,listen: false).mode == ThemeMode.light
                    ? Colors.white
                    : Colors.black,
                borderRadius: const BorderRadius.only(
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
                      child: CircularProgressIndicator(),
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
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: Center(
                                      child: Text(
                                        countryModel!.nativeNameEn,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Provider.of<ThemeServices>(context)
                                                .mode ==
                                                ThemeMode.light
                                                ? Colors.black
                                                : Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 175,
                                height: 150,
                                padding: const EdgeInsets.all(8),
                                // Border width
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(20)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(48),
                                    // Image radius
                                    child: Image.network(countryModel!.flag,
                                        fit: BoxFit.contain),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Country Name:',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          Text(
                            countryModel!.countryName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Provider.of<ThemeServices>(context).mode ==
                                    ThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Capital:',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          Text(
                            countryModel!.capital,
                            style: TextStyle(
                                color: Provider.of<ThemeServices>(context).mode ==
                                    ThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Native Name:',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          Text(
                            countryModel!.nativeNameAr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Provider.of<ThemeServices>(context).mode ==
                                    ThemeMode.light
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    );
                  } else if (state is CountryFailure) {
                    return const Center(
                      child: Text('Something went wrong, Please try again'),
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'there is no Country Information',
                            style: TextStyle(
                              fontSize: 30,
                            ),
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
