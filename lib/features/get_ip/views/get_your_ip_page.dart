import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_ip/core/theme/theme_services.dart';
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
      body: Stack(
        children: const [
          IPContainer(),
        ],
      ),
    );
  }
}
