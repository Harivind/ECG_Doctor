import 'package:doctor/screens/patient_list_screen.dart';
import 'package:doctor/screens/patient_screen.dart';
import 'package:doctor/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String id = "homeScreen";
  final FirebaseUser loggedInUser;

  HomeScreen({this.loggedInUser});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: Scaffold(
        body: selectedItem == 1
            ? PatientList()
            : Center(
                child: Text("Home Screen"),
              ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedItem,
          items: [
            BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text('Patients'),
              icon: Icon(Icons.local_hospital),
            ),
            BottomNavigationBarItem(
              title: Text('Account'),
              icon: Icon(Icons.person_outline),
            ),
          ],
          elevation: 0,
          onTap: (value) {
            if (value == 2) {
              Navigator.pushNamedAndRemoveUntil(
                  context, WelcomeScreen.id, (route) => false);
            }
            setState(() {
              selectedItem = value;
              print(selectedItem);
            });
          },
        ),
      ),
    );
  }
}
