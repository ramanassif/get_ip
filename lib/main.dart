import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:your_ip/cubits/country_cubit/country_cubit.dart';
import 'package:your_ip/cubits/ip_cubit/ip_cubit.dart';
import 'package:your_ip/screens/get_your_ip_page.dart';
import 'package:your_ip/screens/home_page.dart';
import 'package:your_ip/services/country_services.dart';
import 'package:your_ip/services/ip_services.dart';
import 'package:your_ip/services/theme_services.dart';
import 'package:your_ip/theme.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<IPCubit>(
        create: (context) {
          return IPCubit(IPServices());
        },
      ),
      BlocProvider<CountryCubit>(
        create: (context) {
          return CountryCubit(CountryServices());
        },
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeServices>(
      create: (_) => ThemeServices(),
      child: Consumer<ThemeServices>(
        builder: (_, model, __) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          themeMode: model.mode,
          initialRoute: MyHomePage.routeName,
          routes: {
            MyHomePage.routeName: (context) => const MyHomePage(),
            GetYourIPPage.routeName: (context) => const GetYourIPPage(),
          },
        ),
      ),
    );
  }
}
