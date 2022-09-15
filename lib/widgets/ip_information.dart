import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:your_ip/cubits/country_cubit/country_cubit.dart';
import 'package:your_ip/cubits/country_cubit/country_state.dart';
import 'package:your_ip/cubits/ip_cubit/ip_cubit.dart';
import 'package:your_ip/models/country_model.dart';
import 'package:your_ip/models/ip_model.dart';
import 'package:your_ip/services/theme_services.dart';

class IPInformation extends StatefulWidget {
  const IPInformation({Key? key}) : super(key: key);

  @override
  State<IPInformation> createState() => _IPInformationState();
}

class _IPInformationState extends State<IPInformation> {
  IpModel? ipModelData;
  CountryModel? countryModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.red,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  'Your IP is:',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                BlocProvider.of<IPCubit>(context).ipModel!.ip,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 80,
          left: 20,
          right: 20,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            decoration: BoxDecoration(
              color: Provider.of<ThemeServices>(context).mode == ThemeMode.light
                  ? Colors.white
                  : Colors.black,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: BlocBuilder<CountryCubit, CountryState>(
              builder: (context, state) {
                if (state is CountryLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CountrySuccess) {
                  countryModel =
                      BlocProvider.of<CountryCubit>(context).countryModel;
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
                                Text(
                                  BlocProvider.of<CountryCubit>(context)
                                      .countryModel!
                                      .nativeNameEn,
                                  style: TextStyle(
                                      color: Provider.of<ThemeServices>(context)
                                                  .mode ==
                                              ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
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
                                  child: Image.network(
                                      BlocProvider.of<CountryCubit>(context)
                                          .countryModel!
                                          .flag,
                                      fit: BoxFit.cover),
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
                          BlocProvider.of<CountryCubit>(context)
                              .countryModel!
                              .countryName,
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
                          BlocProvider.of<CountryCubit>(context)
                              .countryModel!
                              .capital,
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
                          BlocProvider.of<CountryCubit>(context)
                              .countryModel!
                              .nativeNameAr,
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
    );
  }
}
