import 'package:flutter/material.dart';

class BlaButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  // final VoidCallback onPressed;

  const BlaButton({
    super.key,
    required this.icon,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    // required this.onPressed,
  });

@override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      onPressed: () {},
      icon: Icon(icon, color: textColor),
      label: Text(text, style: TextStyle(color: textColor)),
    );
  }
}
