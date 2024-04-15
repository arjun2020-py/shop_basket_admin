import 'package:flutter/material.dart';

import '../custom_color.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.08,
      width: MediaQuery.sizeOf(context).width * 0.5,
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: buttonColor),
          onPressed:onPressed,
          icon: Icon(
            Icons.shopping_cart,
            color: whiteColor,
          ),
          label: Text(
            'Add To Cart',
            style: TextStyle(color: whiteColor),
          )),
    );
  }
}
