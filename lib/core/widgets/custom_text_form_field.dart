import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool autoValidate;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.autoValidate = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      validator: validator,
      autovalidateMode:
      autoValidate ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }
}
