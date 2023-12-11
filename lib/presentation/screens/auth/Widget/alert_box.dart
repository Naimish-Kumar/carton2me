import 'package:flutter/material.dart';
Widget alertBox(BuildContext context,
    {required String title,
    required String content,
    String? imageUrl,
    VoidCallback? onpressed}) {
  return AlertDialog(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    title: Text(
      title,
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        imageUrl == null
            ? const SizedBox()
            : Image.asset(
                imageUrl,
                height: 50,
              ),
        const SizedBox(
          height: 10,
        ),
        Text(
          content,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    ),
    actions: [
      TextButton(
        onPressed: onpressed,
        child: const Text(
          'Yes',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
        ),
      ),
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          'No',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.red),
        ),
      ),
    ],
  );
}
