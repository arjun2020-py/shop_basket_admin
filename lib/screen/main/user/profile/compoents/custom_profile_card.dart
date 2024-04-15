import 'package:flutter/material.dart';

import '../../../../../utils/custom_color.dart';
import '../../../../../utils/custom_widget/custom_text.dart';


class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard(
      {super.key,
      required this.text,
      required this.prefixIcon,
      required this.sufixIcon});
  final String text;
  final IconData prefixIcon;
  final IconData sufixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: whiteColor),
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                prefixIcon,
                color: greenColor,
              ),
              title: CustomText(
                  text: text,
                  color: blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    sufixIcon,
                    size: 16,
                    color: greenColor,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(),
            )
          ],
        ),
      ),
    );
  }
}
