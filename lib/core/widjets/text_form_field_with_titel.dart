import 'package:flutter/material.dart';

class TextFormFieldWithTitel extends StatelessWidget {
  const TextFormFieldWithTitel({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.validator,
  });

  final String title;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16,color: Colors.green),
        ),
        SizedBox(height: 6),
        TextFormField(
          validator: validator,
          controller: controller,
          cursorColor: Colors.green,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            filled: true,
            fillColor: Colors.green[50],
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.green, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.green, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
