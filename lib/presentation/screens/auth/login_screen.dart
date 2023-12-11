import 'dart:convert';

import 'package:carton2me/core/routes.dart';
import 'package:carton2me/data/model/user_model/user_model.dart';
import 'package:carton2me/main.dart';
import 'package:carton2me/presentation/screens/auth/Widget/InputField.dart';
import 'package:carton2me/presentation/screens/auth/Widget/submit_button.dart';
import 'package:carton2me/presentation/screens/auth/forgot_password.dart';
import 'package:carton2me/presentation/screens/auth/signup_screen.dart';
import 'package:carton2me/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:loading_indicator/loading_indicator.dart';

class LoginScreen extends StatefulWidget {
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
                      ? const SizedBox(
                          height: 70,
                          child: LoadingIndicator(
                            indicatorType: Indicator.ballSpinFadeLoader,
                            colors: [Colors.red, Colors.pink],
                            strokeWidth: 1,
                          ),
                        )
                      : SubmitButton(
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

  Future loginUser({
    required String email,
    required String password,
  }) async {
    setState(() {
      isLoading = true;
    });
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request(
        'POST', Uri.parse('https://api.carton.site/api/users/login'));
    request.body = json.encode({
      "email": email,
      "password": password,
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print('response: ${response}');
    if (response.statusCode == 200) {
      final res = await response.stream.bytesToString();
      final jsonResponse = json.decode(res);
      print('jsonResponse: ${jsonResponse}');

      if (jsonResponse['status'] == 'error') {
        setState(() {
          isLoading = false;
        });
          Fluttertoast.showToast(
            msg: jsonResponse['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
              backgroundColor: Colors.red.withOpacity(0.1),
            textColor: Colors.red,
            fontSize: 16.0);
      } else if (jsonResponse['status'] == 'success') {
        setState(() {
          isLoading = false;
        });

        final userdata = jsonResponse['users'];
        UserModel user = UserModel.fromJson(userdata);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(user: user),
            ));
              Fluttertoast.showToast(
            msg: "User Logged In Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green.withOpacity(0.1),
            textColor: Colors.green,
            fontSize: 16.0);

        return user;
      }
    } else {
      setState(() {
        isLoading = false;
      });
      print(response.reasonPhrase);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text("User not found"),

      //   ),
      // );
      Fluttertoast.showToast(
          msg: "User Not Found",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
            backgroundColor: Colors.white.withOpacity(0.5),
          textColor: Colors.red,
          fontSize: 16.0);
    }
  }
}
