import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:your_ip/core/theme/theme.dart';
import 'package:your_ip/core/theme/theme_services.dart';
import 'package:your_ip/features/get_ip/blocs/country_bloc/country_bloc.dart';
import 'package:your_ip/features/get_ip/blocs/ip_bloc/ip_bloc.dart';
import 'package:your_ip/features/get_ip/repositories/ip_services.dart';
import 'package:your_ip/features/get_ip/views/widgets/container_content.dart';

class GetYourIPPage extends StatefulWidget {
  static String routeName = '/get_ip';

  const GetYourIPPage({Key? key}) : super(key: key);

  @override
  State<GetYourIPPage> createState() => _GetYourIPPageState();
}

class _GetYourIPPageState extends State<GetYourIPPage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IpBloc()..add(GetIp(ipServices: IPServices())),
      child: BlocProvider(
        create: (context)=> CountryBloc(),
        child: Builder(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: firstPurpleClr,
                title: const Text('Get Your IP',style: TextStyle(color: fourthColor),),
                actions: [
                  IconButton(
                    onPressed: () {
                      Provider.of<ThemeServices>(context, listen: false).toggleMode();
                    },
                    icon: Provider.of<ThemeServices>(context).mode == ThemeMode.dark
                        ? const Icon(Icons.wb_sunny_outlined,color: fourthColor,)
                        : const Icon(Icons.nightlight_round_outlined,color: fourthColor,),
                  ),
                ],
              ),
              backgroundColor: secondPurpleClr,
              body: Stack(
                children: const [
                  IPContainer(),
                ],
              ),
            );
          },
        ),
      )
    );
  }
}
