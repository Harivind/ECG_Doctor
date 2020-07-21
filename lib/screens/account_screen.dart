import 'package:doctor/widgets/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  static String id = "accountScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
