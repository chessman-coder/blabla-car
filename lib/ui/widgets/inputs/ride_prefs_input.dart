import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class RidePrefsInput extends StatelessWidget {
  final IconData leftIcon;
  final IconData? rightIcon;
  final String title;
  final bool placeholder;
  final VoidCallback onPressed;
  final VoidCallback? rightIconPressed;
  const RidePrefsInput({
    super.key,
    required this.leftIcon,
    required this.title,
    required this.onPressed,
    this.rightIcon,
    this.placeholder = false,
    this.rightIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    Color placeholderColor = placeholder
        ? BlaColors.textLight
        : BlaColors.textNormal;
    return ListTile(
      onTap: onPressed,
      title: Text(
        title,
        style: TextStyle(fontSize: 14, color: placeholderColor),
      ),
      leading: Icon(leftIcon, size: 24, color: BlaColors.iconLight),
      trailing: rightIcon != null
          ? GestureDetector(
              onTap: rightIconPressed,
              child: Icon(rightIcon, size: 24, color: BlaColors.iconNormal),
            )
          : null,
    );
  }
}
