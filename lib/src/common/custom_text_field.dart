import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextEditingController controller;
  final FocusNode focusNode;
  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.isPassword = false,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      focusNode: focusNode,
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
