import 'package:flutter/material.dart';

import '../custom_color.dart';

class CustomElevButton extends StatelessWidget {
  CustomElevButton({
    super.key,
    required this.width,
    required this.onPressed,
    required this.child,
    
    this.bgColor,
    this.boderRadius
  });
  final void Function()? onPressed;
  final Widget child;
  Color? bgColor;
  double? boderRadius;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: bgColor,
              side: BorderSide(color: whiteColor),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(boderRadius!))),
          onPressed: onPressed,
          child: child),
    );
  }
}
