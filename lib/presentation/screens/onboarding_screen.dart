import 'package:carton2me/presentation/screens/auth/login_screen.dart';
import 'package:carton2me/presentation/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatelessWidget {
    static const String isLoggedInKey = 'isLoggedIn';
    static const String routeName = 'onboardingscreen';
    static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLoggedInKey) ?? false;
  }
  final List<Introduction> list = [
    Introduction(
      titleTextStyle: const TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
      title: 'Buy & Sell',
      subTitle: 'Browse the menu and order directly from the application',
      imageUrl: 'assets/images/img1.png',
    ),
    Introduction(
      titleTextStyle: const TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
      title: 'Delivery',
      subTitle: 'Your order will be immediately collected and',
      imageUrl: 'assets/images/img2.png',
    ),
    Introduction(
      title: 'Receive Money',
      titleTextStyle: const TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
      subTitle: 'Pick up delivery at your door and enjoy groceries',
      imageUrl: 'assets/images/img3.png',
    ),
    Introduction(
      titleTextStyle: const TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
      title: 'Finish',
      subTitle: 'Browse the menu and order directly from the application',
      imageUrl: 'assets/images/img4.png',
    ),
  ];

  @override
  Widget build(context) {
    return IntroScreenOnboarding(
      introductionList: list,
      skipTextStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
      onTapSkipButton: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return  isLoggedInKey== true
                  ? const DashBoard()
                  : LoginScreen();
            }
          ),
        );
      },
    );
  }
}


