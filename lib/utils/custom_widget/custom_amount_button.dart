import 'package:flutter/material.dart';

import '../custom_color.dart';
import 'custom_text.dart';

class CustomAmountButton extends StatelessWidget {
  const CustomAmountButton({
    super.key,
    required this.amount
  });
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.currency_rupee,
          size: 16,
        ),
        CustomText(
            text:amount,
            color: blackColor,
            fontSize: 16,
            fontWeight: FontWeight.w400),
      ],
    );
  }
}
