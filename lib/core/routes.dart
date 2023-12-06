import 'package:carton2me/presentation/screens/auth/login_screen.dart';
import 'package:carton2me/presentation/screens/auth/signup_screen.dart';
import 'package:carton2me/presentation/screens/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';
  static Route createRoute({required Widget child}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return CupertinoPageRoute(builder: (context) => LoginScreen());
      case SignUpScreen.routeName:
        return CupertinoPageRoute(builder: (context) => SignUpScreen());
        case OnBoardingScreen.routeName:
        return CupertinoPageRoute(builder: (context) => OnBoardingScreen());
      default:
      return null;
    }
  }
}
