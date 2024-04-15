import 'package:flutter/material.dart';

import '../../../../../utils/custom_color.dart';
import '../../../../../utils/custom_widget/custom_sized_box.dart';
import '../../../../../utils/custom_widget/custom_text.dart';


class RecommedSection extends StatelessWidget {
  const RecommedSection({
    super.key,
    required this.title
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horzotalSizedBox(10),
        CustomText(
            text:title,
            color: blackColor,
            fontSize: 18,
            fontWeight: FontWeight.w600),
        const Spacer(),
        CustomText(
            text: 'See All ',
            color: greenColor,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
              color: greenColor,
            )),
      ],
    );
  }
}
