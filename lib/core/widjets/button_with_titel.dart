import 'package:flutter/material.dart';

class ButtonWithTitel extends StatelessWidget {
  final VoidCallback onPressed;
  final String titel;

  const ButtonWithTitel({super.key, required this.onPressed, required this.titel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
         titel,
          style: TextStyle(
            fontSize: 18,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
