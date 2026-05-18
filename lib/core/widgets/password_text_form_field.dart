import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool isVisible;
  final VoidCallback onToggleVisibility;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;

  const PasswordTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.isVisible,
    required this.onToggleVisibility,
    required this.validator,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: !isVisible,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: textInputAction,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        suffixIcon: IconButton(
          icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: onToggleVisibility,
        ),
      ),
    );
  }
}
