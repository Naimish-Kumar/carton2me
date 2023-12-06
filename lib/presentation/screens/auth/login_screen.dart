import 'dart:convert';

import 'package:carton2me/core/routes.dart';
import 'package:carton2me/presentation/screens/auth/Widget/InputField.dart';
import 'package:carton2me/presentation/screens/auth/Widget/submit_button.dart';
import 'package:carton2me/presentation/screens/auth/forgot_password.dart';
import 'package:carton2me/presentation/screens/auth/signup_screen.dart';
import 'package:carton2me/presentation/screens/dashboard_screen.dart';
import 'package:carton2me/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<LoginScreen> {
  bool isLoading = false;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    void tryLoginForm() {
      final bool? isValid = _formKey.currentState?.validate();
      if (isValid == true) {
        loginUser(
          email: _emailController.text.trim().toString(),
          password: _passwordController.text.trim().toString(),
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/img2.png'),
                const Text('Welcome Back! Login ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormScreen(
                        hinttext: 'Email id',
                        icon: Icons.mail,
                        textEditingController: _emailController,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Please enter some text';
                          } else if (!p0.contains('@')) {
                            return 'Please enter valid email id';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormScreen(
                        hinttext: 'Password',
                        icon: Icons.lock,
                        textEditingController: _passwordController,
                        suffixIcon: true,
                        obscure: _obscureText,
                        suffixIconWidget: IconButton(
                          icon: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Please enter some text';
                          } else if (p0.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            Routes.createRoute(
                              child: const ForgotPassword(),
                            ),
                          );
                        },
                        child: const Text(
                          'Forget Password ?',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: isLoading
                      ?  const SizedBox(
                        height: 70,
                        child: LoadingIndicator(
                            indicatorType: Indicator.ballSpinFadeLoader,
                            colors: [Colors.red, Colors.pink],
                            strokeWidth: 1,
                          ),
                      )
                      :
                  SubmitButton(
                    text: 'Login',
                    onPressed: tryLoginForm,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'New User?',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          Routes.createRoute(
                            child: SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  
  }
   Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    setState(() {
      isLoading = true;
    });

    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcl9pZCI6IlNBMDAwMSIsImVtYWlsX2FkZHJlc3MiOiJhZG1pbkBhZG1pbi5jb20iLCJleHBpcmVzSW4iOjE3MDM4NTA1MTEsImlhdCI6MTcwMTg1MjQ5NX0._Rk1KSREwWAGtefiaXjZXJElSZadhk3Ofe_l1D0nBMc'
    };

    var request = http.Request(
        'POST', Uri.parse('https://api.carton.site/api/users/login'));
    request.body = json.encode({
      "email": email,
      "password": password,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(OnBoardingScreen.isLoggedInKey, true);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DashBoard(),
        ),
      );

      setState(() {
        isLoading = false;
      });
      // Navigate to the home page or perform any action upon successful login
      print(await response.stream.bytesToString());
    } else {
      setState(() {
        isLoading = false;
      });
      print(response.reasonPhrase);
      // Handle login failure, show error message, etc.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("User not found"),
        ),
      );
    }
  }

}
