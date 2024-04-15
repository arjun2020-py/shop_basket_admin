import 'package:flutter/material.dart';

import '../custom_color.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: whiteColor, shape: BoxShape.circle),
        child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)));
  }
}
