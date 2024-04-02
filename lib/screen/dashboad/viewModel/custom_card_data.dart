import 'package:flutter/material.dart';

import '../../../utils/custom_color.dart';
import '../../../utils/custom_widget/custom_text.dart';

class CustomCardData extends StatelessWidget {
  const CustomCardData(
      {super.key,
      required this.text,
      required this.icons,
      required this.count});
  final String text;
  final IconData icons;
  final String count;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: customCardColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icons),
          CustomText(
              text: text,
              color: blackColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
          SizedBox(
            width: 100,
            height: 50,
            child: Card(
              color: appSplashColor,
              child: Center(
                child: CustomText(
                    text: count,
                    color: whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }
}
