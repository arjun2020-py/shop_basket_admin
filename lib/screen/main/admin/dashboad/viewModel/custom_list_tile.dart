import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.text,required this.icons,required this.onTap});
  final String text;
  final IconData icons;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      
      leading:  Icon(icons),
      title: Text(text),
      onTap: onTap
    );
  }
}
