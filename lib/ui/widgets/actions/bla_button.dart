import 'package:flutter/material.dart';

class BlaButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final Color textColor;
  final Color? backgroundColor;

  const BlaButton({
    super.key,
    this.icon,
    required this.text,
    this.textColor = Colors.white,
    this.backgroundColor = const Color(0xFF00aff5),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        )
      ),
      onPressed: () {},
      icon: Icon(icon, color: textColor),
      label: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
