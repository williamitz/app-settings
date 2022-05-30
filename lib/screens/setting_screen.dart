import 'package:app_setitings/providers/preferences.dart';
import 'package:app_setitings/providers/theme_provider.dart';
import 'package:flutter/material.dart';

import 'package:app_setitings/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // String name = 'Fulanito';
  // int gender = 1;
  // bool darkmode = false;
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ajustes',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
              ),
              const Divider(),
              SwitchListTile.adaptive(
                  value: Preferences.darkmode,
                  title: const Text('Darkmode'),
                  onChanged: (value) {
                    Preferences.darkmode = value;

                    final themeprovider = Provider.of<ThemeProvider>(context, listen: false);

                    value
                        ? themeprovider.setDarkMode()
                        : themeprovider.setLightMode();

                    setState(() {});
                  }),
              const Divider(),
              RadioListTile<int>(
                  value: 1,
                  title: const Text('Masculino'),
                  groupValue: Preferences.gender,
                  onChanged: (value) {
                    Preferences.gender = value ?? 1;
                    setState(() {});
                  }),
              const Divider(),
              RadioListTile<int>(
                  value: 2,
                  title: const Text('Femenino'),
                  groupValue: Preferences.gender,
                  onChanged: (value) {
                    Preferences.gender = value ?? 2;
                    setState(() {});
                  }),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: Preferences.name,
                  decoration: const InputDecoration(
                      labelText: 'Nombre', helperText: 'Nombre del usuario'),
                  onChanged: (value) {
                    Preferences.name = value;
                    setState(() {});
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
