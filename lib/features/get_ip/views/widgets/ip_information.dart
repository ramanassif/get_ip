import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_ip/core/basics_widgets/error_message.dart';
import 'package:your_ip/core/basics_widgets/flag_container.dart';
import 'package:your_ip/core/basics_widgets/generic_loader.dart';
import 'package:your_ip/core/storage_services/storage_service.dart';
import 'package:your_ip/core/theme/theme.dart';
import 'package:your_ip/features/get_ip/blocs/country_bloc/country_bloc.dart';
import 'package:your_ip/features/get_ip/models/country_model.dart';
import 'package:your_ip/features/get_ip/models/ip_model.dart';

class IpInformation extends StatefulWidget {
  const IpInformation({Key? key, required this.ipModelData}) : super(key: key);
  final IpModel ipModelData;

  @override
  State<IpInformation> createState() => _IpInformationState();
}

class _IpInformationState extends State<IpInformation> {
  CountryModel? countryModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: fourthColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  'Your IP is:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                widget.ipModelData.ip,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.13,
          left: 20,
          right: 20,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height * 0.6,
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
                                Text(
                                  countryModel!.nativeNameEn,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
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
                  return const GenericLoader();
                }
              },
            ),
          ),
        ),
      ],
    );
  }

}
