import 'package:flutter/material.dart';

Future<void> showAppDialog(
    BuildContext context, {
      required String title,
      required String message,
      bool isError = true,
    }) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        title,
        style: TextStyle(
          color: isError ? Colors.red : Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(message),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}