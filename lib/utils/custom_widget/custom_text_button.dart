import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.onPressed, required this.child});
  final void Function() onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: child);
  }
}
