import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  String text;
  VoidCallback onPressed;

   SubmitButton({
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(colors: [Colors.red, Colors.pink])),
        height: 50,
        child:  Center(
          child: Text(text,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
