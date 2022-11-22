import 'package:flutter/material.dart';
import 'package:your_ip/core/theme/theme.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'All Countries',
      style: TextStyle(color: fourthColor),
    );
  }
}
