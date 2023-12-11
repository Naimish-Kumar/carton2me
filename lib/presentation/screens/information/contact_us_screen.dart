import 'package:flutter/material.dart';

class ContactUsscreen extends StatefulWidget {
  const ContactUsscreen({super.key});

  @override
  State<ContactUsscreen> createState() => _ContactUsscreenState();
}

class _ContactUsscreenState extends State<ContactUsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Us',
          style: TextStyle(
              color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
