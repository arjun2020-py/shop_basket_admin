import 'package:flutter/material.dart';

import '../../screen/auth/register/view/screen_register.dart';
import '../custom_color.dart';
import 'custom_text.dart';
import 'custom_text_button.dart';

class CustomAuthOption extends StatelessWidget {
  const CustomAuthOption(
      {super.key, required this.optionText, required this.textButtonText,required this.onPressed});
  final String optionText;
  final String textButtonText;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText(
            text: optionText,
            color: blackColor,
            fontSize: 14,
            fontWeight: FontWeight.w400),
        CustomTextButton(
          onPressed: onPressed,
          child: CustomText(
              text: textButtonText,
              color: blueColor,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
