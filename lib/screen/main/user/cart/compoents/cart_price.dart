import 'package:flutter/material.dart';

import '../../../../../utils/custom_color.dart';
import '../../../../../utils/custom_widget/custom_amount_button.dart';
import '../../../../../utils/custom_widget/custom_sized_box.dart';
import '../../../../../utils/custom_widget/custom_text.dart';



class CartPriceAmount extends StatelessWidget {
  const CartPriceAmount({
    super.key,
    required this.text

  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horzotalSizedBox(15),
        CustomText(
            text: text,
            color: blackColor,
            fontSize: 18,
            fontWeight: FontWeight.w400),
        Spacer(),
        CustomAmountButton(amount: '300',),
        horzotalSizedBox(20)
      ],
    );
  }
}
