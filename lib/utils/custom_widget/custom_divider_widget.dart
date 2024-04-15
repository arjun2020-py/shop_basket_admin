import 'package:flutter/material.dart';
import 'package:shop_basket_admin/utils/custom_color.dart';
import 'package:shop_basket_admin/utils/custom_widget/custom_sized_box.dart';

class CustomDivderWidget extends StatelessWidget {
  const CustomDivderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horzotalSizedBox(10),
        Expanded(
          child: Divider(
            color: blackColor,
            thickness: 0.3,
          ),
        ),
        horzotalSizedBox(10),
        Text('Or'),
        horzotalSizedBox(10),
        Expanded(
          child: Divider(
            color: blackColor,
            thickness: 0.3,
          ),
        ),
        horzotalSizedBox(10),
      ],
    );
  }
}