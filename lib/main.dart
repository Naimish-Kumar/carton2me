import 'package:carton2me/core/app_helper.dart';
import 'package:carton2me/core/ui.dart';

import 'package:carton2me/presentation/screens/auth/login_screen.dart';
import 'package:carton2me/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  LocDb.isLoggedIn();
}

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    print("${AppHelper.ACCESSTOKEN}");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.defaultTheme,
      home:
          AppHelper.ACCESSTOKEN.isNotEmpty ? const HomeScreen() : LoginScreen(),
    );
  }
}
