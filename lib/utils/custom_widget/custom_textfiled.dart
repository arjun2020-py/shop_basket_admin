import 'package:flutter/material.dart';

import '../custom_color.dart';

class CustomTextfiled extends StatelessWidget {
  CustomTextfiled(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.validator,
      this.prefixOnPressed,
      this.icons,
      this.obscureText,
      });
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  void Function()? prefixOnPressed;
  bool? obscureText;
  IconData? icons;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        obscureText:obscureText! ,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            prefixIcon:
                IconButton(onPressed: prefixOnPressed, icon: Icon(icons)),
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
            hintText: hintText,
            filled: true,
            fillColor: whiteColor),
      ),
    );
  }
}
