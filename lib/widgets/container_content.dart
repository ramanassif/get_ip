import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_ip/cubits/ip_cubit/ip_cubit.dart';
import 'package:your_ip/cubits/ip_cubit/ip_state.dart';
import 'package:your_ip/models/country_model.dart';
import 'package:your_ip/models/ip_model.dart';
import 'package:your_ip/widgets/ip_information.dart';

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
    return BlocBuilder<IPCubit, IPState>(
      builder: (context, state) {
        if (state is IPLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is IPSuccess) {
          ipModelData = BlocProvider.of<IPCubit>(context).ipModel;
          return const IPInformation();
        } else if (state is IPFailure) {
          return const Center(
            child: Text('Something went wrong, Please try again'),
          );
        } else {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'there is no ip',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
