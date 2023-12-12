import 'dart:convert';
import 'package:carton2me/core/api.dart';
import 'package:carton2me/core/routes.dart';
import 'package:carton2me/data/model/user_model/user_model.dart';
import 'package:carton2me/presentation/screens/auth/Widget/InputField.dart';
import 'package:carton2me/presentation/screens/auth/Widget/submit_button.dart';
import 'package:carton2me/presentation/screens/auth/login_screen.dart';
import 'package:carton2me/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => SignUpState();
}

class SignUpState extends State<SignUpScreen> {
  bool _obscureText = true;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _reppasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _compnyNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void trySubmitForm() {
      final bool? isValid = _formKey.currentState?.validate();
      if (isValid == true) {
        registerUser(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          reppassword: _reppasswordController.text,
          phone: _phoneController.text,
          context: context,
          compnyName: _compnyNameController.text,
        );
      }
    }

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
                      TextFormScreen(
                        hinttext: 'Compny Name',
                        icon: Icons.location_city,
                        textEditingController: _compnyNameController,
                        keyboardType: TextInputType.phone,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Please enter compny name';
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
                                  colors: [Colors.red, Colors.pink],
                                  strokeWidth: 1,
                                ),
                              )
                            : SubmitButton(
                                text: 'Register',
                                onPressed: () {
                                  trySubmitForm();
                                },
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

  Future registerUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String reppassword,
      required String phone,
      required String compnyName,
      required BuildContext context}) async {
    setState(() {
      isLoading = true;
    });

    var headers = {
      'Content-Type': 'application/json',
    };

    var request = http.Request('POST', Uri.parse(ApiUrls.createUser));
    request.body = json.encode({
      "first_name": firstName,
      "last_name": lastName,
      "email_address": email,
      "user_password": password,
      "phone_number": phone,
      "company_name": compnyName,
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final res = await response.stream.bytesToString();
      final jsonResponse = json.decode(res);

      if (jsonResponse['status'] == 'error') {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(jsonResponse['message']),
          ),
        );
      } else if (jsonResponse['status'] == 'success') {
        setState(() {
          isLoading = false;
        });
        final userdata = jsonResponse['users'];
        UserModel user = UserModel.fromJson(userdata);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', jsonResponse['accessToken']);
        prefs.setString('userId', user.id.toString());
        prefs.setString('firstName', user.firstName.toString());
        prefs.setString('lastName', user.lastName.toString());
        prefs.setString('email', user.emailAddress.toString());
        prefs.setString('phoneNumber', user.phoneNumber.toString());
        prefs.setString('companyName', user.companyName.toString());
        prefs.setString('dateOfBirth', user.dateOfBirth.toString());
        prefs.setString('userAvatar', user.userAvatar.toString());
        Fluttertoast.showToast(
            msg: "User Registered Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red.withOpacity(0.1),
            textColor: Colors.red,
            fontSize: 16.0);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));

        return user;
      }
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Some erroe occured"),
        ),
      );
    }
  }
}
