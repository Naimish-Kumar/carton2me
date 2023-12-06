
import 'package:flutter/material.dart';


class TextFormScreen extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hinttext;
  final IconData icon;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool obscure;
  final bool obscure1;
  final bool suffixIcon;
  final Widget? suffixIconWidget;
  final void Function()? onPressed;
  final TextInputType? keyboardType;

  const TextFormScreen({
    super.key,
    required this.textEditingController,
    required this.hinttext,
    required this.icon,
    this.obscure = true,
    this.obscure1 = true,
    this.validator,
    this.readOnly = false,
    this.suffixIcon = false,
    this.suffixIconWidget,
    this.onPressed,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 6.h,
      child: TextFormField(
        controller: textEditingController,
        readOnly: readOnly,
        obscureText: suffixIcon ? obscure : false,
        // obscureText1: suffixIcon ? obscure : false,
        decoration: InputDecoration(
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(13),
            filled: true,
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 14, fontFamily: 'Amazon'),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
            prefixIcon: Icon(
              icon,
              size: 20,
              color: Colors.black,
            ),
            suffixIcon: suffixIcon
                ? suffixIconWidget ??
                    IconButton(
                        onPressed: onPressed,
                        icon: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility,
                          color: Colors.black,
                        ))
                : null),
        validator: validator,
      ),
    );
  }
}
