import 'dart:convert';

import 'package:carton2me/core/api.dart';
import 'package:carton2me/core/app_helper.dart';
import 'package:carton2me/core/routes.dart';
import 'package:carton2me/data/model/user_model/user_model.dart';
import 'package:carton2me/presentation/screens/auth/Widget/InputField.dart';
import 'package:carton2me/presentation/screens/auth/Widget/submit_button.dart';
import 'package:carton2me/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:loading_indicator/loading_indicator.dart';

class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen({
    super.key,
  });

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscureText = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Password',
          style: TextStyle(
              color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Update your current password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormScreen(
                  hinttext: 'Current Password',
                  icon: Icons.password,
                  textEditingController: _currentPasswordController,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Please enter some text';
                    } else if (p0.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  suffixIconWidget: IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  obscure: _obscureText,
                  suffixIcon: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormScreen(
                  hinttext: 'New Password',
                  icon: Icons.lock,
                  textEditingController: _newPasswordController,
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
                  textEditingController: _confirmPasswordController,
                  suffixIcon: true,
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
                  height: 30,
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
                          text: 'Submit',
                          onPressed: () {
                            changePassword();
                          },
                        ),
                ),
              ],
            ),
          )),
    );
  }

  Future<void> changePassword() async {
    setState(() {
      isLoading = true;
    });
    if (_newPasswordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
        ),
      );
    }
    if (_currentPasswordController.text == _newPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Current password cannot be the same as new password'),
        ),
      );
    }
    if (_newPasswordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
        ),
      );
    } else {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppHelper.ACCESSTOKEN}'
      };
      var request = http.Request('POST', Uri.parse(ApiUrls.changePassword));
      request.body = json.encode({
        "oldPassword": _confirmPasswordController.text,
        "newPassword": _newPasswordController.text
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(
            msg: "Password Changed Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red.withOpacity(0.1),
            textColor: Colors.red,
            fontSize: 16.0);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context,
            Routes.createRoute(
              child: const HomeScreen(),
            ));
        print(await response.stream.bytesToString());
      } else {
        setState(() {
          isLoading = false;
        });
        print(response.reasonPhrase);
        Fluttertoast.showToast(
            msg: "Something went wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red.withOpacity(0.1),
            textColor: Colors.red,
            fontSize: 16.0);
      }
    }
  }
}
