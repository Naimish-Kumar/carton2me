import 'package:carton2me/presentation/screens/auth/Widget/InputField.dart';
import 'package:carton2me/presentation/screens/auth/Widget/submit_button.dart';
import 'package:flutter/material.dart';
class AddDetailsScreen extends StatelessWidget {
  const AddDetailsScreen({
    super.key,
    required this.item1Controller,
  });

  final TextEditingController item1Controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Add Details',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormScreen(
                hinttext: 'Item1',
                textEditingController: item1Controller,
                icon: Icons.lock,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormScreen(
                hinttext: 'Item1',
                textEditingController: item1Controller,
                icon: Icons.lock,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormScreen(
                hinttext: 'Item1',
                textEditingController: item1Controller,
                icon: Icons.lock,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormScreen(
                hinttext: 'Item1',
                textEditingController: item1Controller,
                icon: Icons.lock,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormScreen(
                hinttext: 'Item1',
                textEditingController: item1Controller,
                icon: Icons.lock,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: SubmitButton(
                onPressed: () {},
                text: 'Submit',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
