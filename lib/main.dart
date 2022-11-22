import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:your_ip/core/theme/theme.dart';
import 'package:your_ip/core/theme/theme_services.dart';
import 'package:your_ip/features/countries/views/country_information.dart';
import 'package:your_ip/features/get_ip/blocs/country_bloc/country_bloc.dart';
import 'package:your_ip/features/get_ip/views/get_your_ip_page.dart';
import 'package:your_ip/features/get_ip/views/home_page.dart';
import 'package:your_ip/features/search/blocs/search_countries_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CountryBloc()),
        BlocProvider(create: (_) => SearchCountriesBloc()),
      ],
      child: const MyApp(),
    ),
  );
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
            CountryInformation.routeName: (context) =>
                const CountryInformation(),
          },
        ),
      ),
    );
  }
}
