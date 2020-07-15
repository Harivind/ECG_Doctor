import 'package:doctor/screens/login_screen.dart';
import 'package:doctor/screens/registration_screen.dart';
import 'package:doctor/widgets/rounded_buttons.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart' as AnimatedText;
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = "welcomePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
              'assets/images/undraw_medicine_b1ol.svg',
              semanticsLabel: 'Acme Logo',
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedText.FadeAnimatedTextKit(
                  text: ['Heartbeat', 'Doctor'],
                  repeatForever: true,
                  textStyle: TextStyle(fontSize: 30.0),
                  duration: Duration(seconds: 1),
                ),
                Hero(
                  tag: 'logo',
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 40.0,
                  ),
                )
              ],
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              title: "Log In",
              colour: Colors.indigoAccent,
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              title: "Register",
              colour: Colors.indigo,
            ),
          ],
        ),
      ),
    );
  }
}
