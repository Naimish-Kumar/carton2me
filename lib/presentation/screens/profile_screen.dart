import 'package:carton2me/core/app_helper.dart';
import 'package:carton2me/core/routes.dart';
import 'package:carton2me/core/ui.dart';
import 'package:carton2me/data/model/user_model/user_model.dart';
import 'package:carton2me/presentation/screens/auth/Widget/alert_box.dart';
import 'package:carton2me/presentation/screens/auth/login_screen.dart';
import 'package:carton2me/presentation/screens/change_password.dart';
import 'package:carton2me/presentation/screens/information.dart';
import 'package:carton2me/presentation/screens/update_profile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String firstName = '';
  String lastName = '';
  String email = '';
  String phone = '';
  String compnyName = '';
  String dob = '';
  String imageUrl = '';
  //WillPopScopeCallback? onWillPop;

  @override
  void initState() {
    firstName = AppHelper.firstName.toString();
    lastName = AppHelper.lastName.toString();
    email = AppHelper.email.toString();
    phone = AppHelper.phoneNumber.toString();
    compnyName = AppHelper.companyName.toString();
    dob = AppHelper.dateOfBirth.toString();
    imageUrl = 'https://api.carton.site/${AppHelper.userAvatar.toString()}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        showDialog(
            context: context,
            builder: (context) {
              return alertBox(
                context,
                content: 'Do You want to close the app?',
                onpressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    Routes.createRoute(
                      child: LoginScreen(),
                    ),
                    (route) => false,
                  );
                },
                imageUrl: 'assets/images/warning.png',
                title: 'Close App',
              );
            });
      },
      child: Scaffold(
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Center(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.red.withOpacity(0.2),
                              width: 2.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(imageUrl),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "$firstName $lastName",
                          // "${USERMODEL!.firstName} ${USERMODEL!.lastName}",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          email,
                          //USERMODEL!.emailAddress.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          phone,
                          //  USERMODEL!.phoneNumber.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackColor),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView(children: [
                    Card(
                      child: ListTile(
                        trailing: const Icon(
                          Icons.navigate_next,
                          size: 30,
                          color: Colors.red,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: const Text(
                          'Update Profile',
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            Routes.createRoute(
                              child: UpdateProfileScreen(),
                            ),
                          );
                        },
                        leading: Icon(
                          Icons.account_circle_rounded,
                          color: AppColors.secondaryColor,
                          size: 30,
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        trailing: const Icon(
                          Icons.navigate_next,
                          size: 30,
                          color: Colors.red,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: const Text(
                          'Change Password',
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            Routes.createRoute(
                              child: ChangePasswordScreen(),
                            ),
                          );
                        },
                        leading: Icon(
                          Icons.password_rounded,
                          color: AppColors.secondaryColor,
                          size: 30,
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        trailing: const Icon(
                          Icons.navigate_next,
                          size: 30,
                          color: Colors.red,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: const Text(
                          'Information',
                        ),
                        onTap: () {
                          Navigator.push(context,
                              Routes.createRoute(child: const Information()));
                        },
                        leading: Icon(
                          Icons.info_rounded,
                          color: AppColors.secondaryColor,
                          size: 30,
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        trailing: const Icon(
                          Icons.navigate_next,
                          size: 30,
                          color: Colors.red,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: const Text(
                          'Delete Account',
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return alertBox(
                                context,
                                imageUrl: 'assets/images/warning.png',
                                title: 'Delete Account',
                                content:
                                    'Are you sure you want to delete your account?',
                                onpressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    Routes.createRoute(
                                      child: LoginScreen(),
                                    ),
                                    (route) => false,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Account Deleted'),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        leading: Icon(
                          Icons.delete_rounded,
                          color: AppColors.secondaryColor,
                          size: 25,
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        trailing: const Icon(
                          Icons.navigate_next,
                          size: 30,
                          color: Colors.red,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: const Text(
                          'Logout',
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alertBox(
                                context,
                                imageUrl: 'assets/images/attention.png',
                                title: 'Logout',
                                content: 'Are you sure you want to logout?',
                                onpressed: () {
                                  AppHelper.ACCESSTOKEN = "";
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    Routes.createRoute(
                                      child: LoginScreen(),
                                    ),
                                    (route) => false,
                                  );
                                },
                              );
                            },
                          );
                        },
                        leading: Icon(
                          Icons.logout,
                          color: AppColors.secondaryColor,
                          size: 25,
                        ),
                      ),
                    )
                  ]),
                )
              ],
            )),
      ),
    );
  }
}
