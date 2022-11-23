import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:your_ip/core/theme/theme.dart';
import 'package:your_ip/features/countries/views/countries_page.dart';
import 'package:your_ip/features/get_ip/views/get_your_ip_page.dart';

class MyHomePage extends StatefulWidget {
  static String routeName = '/home';

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? flagImg;
  String? nativeName;
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const CountriesPage(),
      const GetYourIPPage(),
    ];
    return Scaffold(
      body: Center(
        child: pages.elementAt(selectedIndex), //New
      ),
      bottomNavigationBar: BottomNavyBar(
        containerHeight: MediaQuery.of(context).size.height * 0.08,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        backgroundColor:firstClr,
        selectedIndex: selectedIndex,
        showElevation: true,
        itemCornerRadius: 18,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => selectedIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(
              Icons.flag,
            ),
            title: const Text('Countries'),
            activeColor: fourthColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(
              Icons.location_on,
            ),
            title: const Text('Your IP'),
            activeColor: fourthColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.flag,
      //       ),
      //       label: "Countries",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.location_on,
      //       ),
      //       label: "Your IP",
      //     ),
      //   ],
      //   currentIndex: selectedIndex,
      //   onTap: _onItemTapped,
      //   fixedColor: fourthColor,
      //   unselectedItemColor: Colors.grey,
      //   backgroundColor: firstClr,
      // ),
    );
  }
  //
  // void _onItemTapped(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //   });
  //   print(selectedIndex);
  // }

}
