import 'package:flutter/material.dart';

Widget BuildImages(String urlImages, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      color: Colors.grey,
      child: Image.asset(
        urlImages,
        fit: BoxFit.fill,
      ),
    );
  }