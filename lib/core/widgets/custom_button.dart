import 'package:flutter/material.dart';
import 'package:online_exam/config/theme/AppTheme.dart';

class CustomButton extends StatelessWidget {
  final bool isEnabled;
  final bool isLoading;
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.isEnabled,
    required this.isLoading,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: isEnabled && !isLoading ? onPressed : null,
      child: isLoading
          ? const CircularProgressIndicator(color: AppTheme.white)
          : Text(
              text,
              style: const TextStyle(fontSize: 16, color: AppTheme.white),
            ),
    );
  }
}
