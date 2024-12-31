import 'package:flutter/material.dart';

class CustomFormText extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validation; // Validation function

  CustomFormText({
    required this.label,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.validation, // Optional validation function
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validation, // Use validation from the widget
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
