import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_ip/core/basics_widgets/error_message.dart';
import 'package:your_ip/core/basics_widgets/generic_loader.dart';
import 'package:your_ip/features/get_ip/blocs/country_bloc/country_bloc.dart';
import 'package:your_ip/features/get_ip/blocs/ip_bloc/ip_bloc.dart';
import 'package:your_ip/features/get_ip/models/country_model.dart';
import 'package:your_ip/features/get_ip/models/ip_model.dart';
import 'package:your_ip/features/get_ip/repositories/country_services.dart';
import 'package:your_ip/features/get_ip/views/widgets/ip_information.dart';

class IPContainer extends StatefulWidget {
  const IPContainer({Key? key}) : super(key: key);

  @override
  State<IPContainer> createState() => _IPContainerState();
}

class _IPContainerState extends State<IPContainer> {
  IpModel? ipModelData;
  CountryModel? countryModel;

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<IpBloc>(context),
      listener: (context, state) {
        if (state is IPSuccess) {
          ipModelData = state.ipModel;
          BlocProvider.of<CountryBloc>(context).add(GetCountryInformation(
              countryServices: CountryServices(), cc: ipModelData!.cc));
        }
      },
      child: BlocBuilder<IpBloc, IpState>(
        builder: (context, state) {
          if (state is IPLoading) {
            return const Center(
              child: GenericLoader(),
            );
          } else if (state is IPSuccess) {
            return IpInformation(
              ipModelData: ipModelData!,
            );
          } else if (state is IPFailure) {
            return const ErrorMessage(
              message: 'Something went wrong, Please try again',
            );
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  GenericLoader(),
                ],
              ),
            );
          }
        },
      ),
    );
  }

}
