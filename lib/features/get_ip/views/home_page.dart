import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_ip/core/theme/theme_services.dart';
import 'package:your_ip/features/countries/views/countries_page.dart';
import 'package:your_ip/features/get_ip/views/button_get_ip_page.dart';

class MyHomePage extends StatefulWidget {
  static String routeName = '/home';

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? flagImg;
  String? nativeName;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const CountriesPage(),
      const ButtonGetYourIP(),
    ];
    return Scaffold(
      body: Center(
        child: pages.elementAt(selectedIndex), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.flag,
            ),
            label: "Countries",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on,
            ),
            label: "Your IP",
          ),
        ],
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    print(selectedIndex);
  }

  @override
  void initState() {
    super.initState();
  }
}
