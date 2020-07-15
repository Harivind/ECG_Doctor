import 'package:doctor/models/data.dart';
import 'package:doctor/screens/home_screen.dart';
import 'package:doctor/screens/patient_list_screen.dart';
import 'package:doctor/screens/welcome_screen.dart';
import 'package:doctor/screens/login_screen.dart';
import 'package:doctor/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return Data();
      },
      child: MaterialApp(
        theme: ThemeData(
            primaryColorDark: Color(0xFF303F9F),
            primaryColor: Color(0xFF3F51B5),
            accentColor: Color(0xFFFF4081),
            primaryColorLight: Color(0xFFC5CAE9),
            primaryTextTheme: TextTheme(
              bodyText1: TextStyle(
                color: Colors.black,
              ),
              bodyText2: TextStyle(
                color: Color(0xFF757575),
              ),
            ),
            dividerColor: Color(0xFFBDBDBD),
            fontFamily: "Roboto",
            textTheme: TextTheme(
                bodyText1: TextStyle(
              fontFamily: "Roboto",
            ))),
        home: Scaffold(
          body: WelcomeScreen(),
        ),
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          PatientList.id: (context) => PatientList()
        },
      ),
    );
  }
}
