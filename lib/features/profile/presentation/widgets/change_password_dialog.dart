import 'package:flutter/material.dart';
import 'package:online_exam/features/profile/data/models/request/change_password_request.dart';
import 'package:online_exam/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:online_exam/features/profile/presentation/cubit/profile_intent.dart';

void showChangePasswordDialog(BuildContext context, ProfileCubit profileCubit) {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: const Text("Change Password"),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: oldPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Enter your old password",
                  labelText: "Old Password",
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? "Required" : null,
              ),
              TextFormField(
                controller: newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "New Password"),
                validator: (val) =>
                    val == null || val.isEmpty ? "Required" : null,
              ),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) return "Required";
                  if (val != newPasswordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                profileCubit.doIntent(
                  ChangePasswordIntent(
                    ChangePasswordRequest(
                      oldPassword: oldPasswordController.text,
                      password: newPasswordController.text,
                      rePassword: confirmPasswordController.text,
                    ),
                  ),
                );
                Navigator.pop(dialogContext);
              }
            },
            child: const Text("Change"),
          ),
        ],
      );
    },
  );
}
