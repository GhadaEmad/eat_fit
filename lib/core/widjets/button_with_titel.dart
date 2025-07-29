import 'package:flutter/material.dart';

class ButtonWithTitel extends StatelessWidget {
  final VoidCallback onPressed;
  final String titel;
  final Color backgroundColor;
  final Color textColor;
  final Widget? icon;

  const ButtonWithTitel({
    super.key,
    required this.onPressed,
    required this.titel,
    this.backgroundColor = Colors.green,
    this.textColor = Colors.white,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: backgroundColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 10),
            ],
            Text(
              titel,
              style: TextStyle(
                fontSize: 18,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
