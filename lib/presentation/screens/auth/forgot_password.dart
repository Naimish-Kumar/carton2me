import 'package:carton2me/presentation/screens/auth/Widget/InputField.dart';
import 'package:carton2me/presentation/screens/auth/Widget/submit_button.dart';
import 'package:flutter/material.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late ScaffoldMessengerState scaffoldMessenger;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                   const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Amazon',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: _formKey,
                    child: TextFormScreen(
                      hinttext: 'Enter your email id',
                      icon: Icons.mail,
                      textEditingController: _emailController,
                    
                    ),
                  ),
                 
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Enter Your Email Address And We Will Send You Verification Code To Reset Your Password",
                    style: TextStyle(
                      fontFamily: 'Amazon',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
                    textAlign: TextAlign.center,
                  ),
                   const SizedBox(
                  height: 20,
                ),
                SubmitButton(
                  text: 'Submit',
                  onPressed: () {
                    _trySubmitForm();
                  },
                ),
                ],
              ),
            ),
          ),
        ),

    );
  }

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
     // forgotPassword(_emailController.text);
      isLoading = true;
    }
  }

  // forgotPassword(String email) async {
  //   Map data = {
  //     'email': email,
  //   };
  //   print(email.toString());

  //   final response = await http.post(Uri.parse(FORGOTPASSWORD),
  //       headers: {
  //         "Accept": "application/json",
  //         "Content-Type": "application/x-www-form-urlencoded"
  //       },
  //       body: data,
  //       encoding: Encoding.getByName("utf-8"));

  //   setState(() {
  //     isLoading = false;
  //   });
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     Map<String, dynamic> res = jsonDecode(response.body);

  //     if (res['status'] == 'success') {
  //       // ignore: use_build_context_synchronously
  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (context) => ResetPassword(email)));
  //     } else {
  //       DialogHelper.showFlutterToast(strMsg: res['msg']);
  //     }
  //   } else {
  //     DialogHelper.showFlutterToast(strMsg: "Something went wrong");
  //   }
  // }


}
