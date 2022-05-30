import 'package:app_setitings/providers/preferences.dart';
import 'package:flutter/material.dart';

import 'package:app_setitings/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Darkmode: ${Preferences.darkmode}'),
          const Divider(),
          Text('Gender: ${Preferences.gender}'),
          const Divider(),
          Text('Name: ${Preferences.name}'),
        ],
      ),
    );
  }
}
