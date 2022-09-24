import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:your_ip/core/theme/theme_services.dart';
import 'package:your_ip/features/get_ip/blocs/ip_bloc/ip_bloc.dart';
import 'package:your_ip/features/get_ip/views/get_your_ip_page.dart';

class MyHomePage extends StatefulWidget {
  static String routeName = '/home';

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Your IP'),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeServices>(context, listen: false).toggleMode();
            },
            icon: Provider.of<ThemeServices>(context).mode == ThemeMode.dark
                ? const Icon(Icons.wb_sunny_outlined)
                : const Icon(Icons.nightlight_round_outlined),
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, GetYourIPPage.routeName);
            BlocProvider.of<IpBloc>(context).getIp();
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
          child: const Text('Get Your IP'),
        ),
      ),
    );
  }
}
