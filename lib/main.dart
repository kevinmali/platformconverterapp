import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platformconverterapp/Cuportino_Screens/ios_page.dart';
import 'package:platformconverterapp/Providers/DateTime.dart';
import 'package:platformconverterapp/Providers/PlatFrome.dart';
import 'package:platformconverterapp/Providers/themes.dart';
import 'package:platformconverterapp/androidscrrens/Ediiting_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider(create: (context) => platformprovider()),
        ListenableProvider(create: (context) => profileprovider()),
        ListenableProvider(create: (context) => themeprovider()),
        ListenableProvider(create: (context) => datetimeprovider()),
        ListenableProvider(create: (context) => themeprovider()),
        ListenableProvider(create: (context) => profileprovider2()),
        ListenableProvider(create: (context) => switchprovider()),
      ],
      builder: (context, _) =>
          (Provider.of<platformprovider>(context, listen: true).Plat.isios ==
                  true)
              ? MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: home(),
                  theme: ThemeData.light(),
                  darkTheme: ThemeData.dark(),
                  themeMode: (Provider.of<themeprovider>(context, listen: true)
                              .theme
                              .isdark ==
                          false)
                      ? ThemeMode.dark
                      : ThemeMode.light,
                )
              : CupertinoApp(
                  debugShowCheckedModeBanner: false,
                  home: home1(),
                ),
    ),
  );
}
