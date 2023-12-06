import 'package:carton2me/core/routes.dart';
import 'package:carton2me/presentation/screens/auth/Widget/InputField.dart';
import 'package:carton2me/presentation/screens/auth/Widget/submit_button.dart';
import 'package:carton2me/presentation/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});
  static const String routeName = 'signup';

  @override
  State<StatefulWidget> createState() => SignUpState();
}

class SignUpState extends State<SignUpScreen> {
  bool _obscureText = true;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final  _firstNameController = TextEditingController();
  final  _lastNameController = TextEditingController();
  final  _emailController = TextEditingController();
  final  _passwordController = TextEditingController();
  final  _reppasswordController = TextEditingController();
  final  _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset('assets/images/img2.png'),
                      const Text(
                        'Create Account?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormScreen(
                        hinttext: 'First Name',
                        icon: Icons.account_circle,
                        textEditingController: _firstNameController,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormScreen(
                        hinttext: 'Last Name',
                        icon: Icons.account_circle,
                        textEditingController: _lastNameController,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
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
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(p0)) {
                            return 'Please enter valid email';
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
                        obscure: _obscureText,
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
                      TextFormScreen(
                        hinttext: 'Confirm Password',
                        icon: Icons.lock,
                        textEditingController: _reppasswordController,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Please enter some text';
                          } else if (p0.length < 6) {
                            return 'Password must be at least 6 characters';
                          } else if (p0 != _passwordController.text) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormScreen(
                        hinttext: 'Phone Number',
                        icon: Icons.phone_android_rounded,
                        textEditingController: _phoneController,
                        keyboardType: TextInputType.phone,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Please enter some text';
                          } else if (p0.length < 10) {
                            return 'Please enter valid phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: isLoading
                            ? const SizedBox(
                              height: 70,
                              child: LoadingIndicator(
                                  indicatorType: Indicator.ballSpinFadeLoader,
                                  colors: [Colors.red,Colors.pink],
                                  strokeWidth: 1,
                                  ),
                            )
                            : SubmitButton(
                                text: 'Register',
                                onPressed: (){},
                              ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'If You Have Account?',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                Routes.createRoute(
                                  child: LoginScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
