import 'package:medico/config/app_config.dart' as config;
import 'package:flutter/material.dart';
import 'package:medico/pages/Welcome.dart';
//import 'package:medico/pages/admin/admin.dart';
import 'package:medico/routes_generator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medico/widgets/connectivity.dart';
import 'package:medico/models/contactprovider.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: ContactProvider()),
        ],
        child: MaterialApp(
          title: 'Mindtime',
          home: AutoLogin(), //Welcome(), // AutoLogin(),
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: Color(0xFF252525),
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Color(0xFF2C2C2C),
            accentColor: config.Colors().mainDarkColor(1),
            hintColor: config.Colors().secondDarkColor(1),
            focusColor: config.Colors().accentDarkColor(1),
            textTheme: TextTheme(
              button: TextStyle(color: Color(0xFF252525)),
              headline5: TextStyle(
                  fontSize: 20.0, color: config.Colors().secondDarkColor(1)),
              headline4: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: config.Colors().secondDarkColor(1)),
              headline3: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: config.Colors().secondDarkColor(1)),
              headline2: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                  color: config.Colors().mainDarkColor(1)),
              headline1: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w300,
                  color: config.Colors().secondDarkColor(1)),
              subtitle1: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: config.Colors().secondDarkColor(1)),
              headline6: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: config.Colors().mainDarkColor(1)),
              bodyText2: TextStyle(
                  fontSize: 12.0, color: config.Colors().secondDarkColor(1)),
              bodyText1: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: config.Colors().secondDarkColor(1)),
              caption: TextStyle(
                  fontSize: 12.0, color: config.Colors().secondDarkColor(0.7)),
            ),
          ),
          theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: Colors.white,
            brightness: Brightness.light,
            accentColor: config.Colors().mainColor(1),
            focusColor: config.Colors().accentColor(1),
            hintColor: config.Colors().secondColor(1),
            textTheme: TextTheme(
              button: TextStyle(color: Theme.of(context).primaryColor),
              headline5: TextStyle(
                  fontSize: 20.0, color: config.Colors().secondColor(1)),
              headline4: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: config.Colors().secondColor(1)),
              headline3: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: config.Colors().secondColor(1)),
              headline2: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                  color: config.Colors().mainColor(1)),
              headline1: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w300,
                  color: config.Colors().secondColor(1)),
              subtitle1: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: config.Colors().secondColor(1)),
              headline6: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: config.Colors().mainColor(1)),
              bodyText2: TextStyle(
                  fontSize: 12.0, color: config.Colors().secondColor(1)),
              bodyText1: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: config.Colors().secondColor(1)),
              caption: TextStyle(
                  fontSize: 12.0, color: config.Colors().secondColor(0.6)),
            ),
          ),
        ));
  }
}
