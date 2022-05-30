import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_setitings/providers/preferences.dart';
import 'package:app_setitings/providers/theme_provider.dart';

import 'package:app_setitings/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (_) => ThemeProvider(isdarkmode: Preferences.darkmode))
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  

    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: '',
      routes: {
        '': (_) => const HomeScreen(),
        'setting': (_) => const SettingScreen(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
