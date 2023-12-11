import 'package:carton2me/core/routes.dart';
import 'package:carton2me/core/ui.dart';
import 'package:carton2me/presentation/screens/information/about_us_screen.dart';
import 'package:carton2me/presentation/screens/information/contact_us_screen.dart';
import 'package:carton2me/presentation/screens/information/faq_screen.dart';
import 'package:carton2me/presentation/screens/information/privacy_policy_screen.dart';
import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Information',
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
                'Our Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
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
                    'About Us',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      Routes.createRoute(
                        child: const AboutUsScreen(),
                      ),
                    );
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
                    'Contsact Us',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      Routes.createRoute(
                        child: const ContactUsscreen(),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.contact_mail_rounded,
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
                    'Privacy Policy',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      Routes.createRoute(
                        child: const PrivacyPolicyScreen(),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.privacy_tip,
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
                    'Faqs',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      Routes.createRoute(
                        child: const FaqScreen(),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.question_answer_rounded,
                    color: AppColors.secondaryColor,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
