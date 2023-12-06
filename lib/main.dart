import 'package:carton2me/core/routes.dart';
import 'package:carton2me/core/ui.dart';
import 'package:carton2me/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.defaultTheme,
     onGenerateRoute: Routes.onGenerateRoute,
     initialRoute: OnBoardingScreen.routeName,
    );
  }
}
