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
        // Small fixed padding for phones
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        title: const Text("Change Password"),
        content: ConstrainedBox(
          // Responsive magic: Allows it to fill the screen on small phones,
          // but prevents it from becoming ridiculously wide on tablets/web.
          constraints: const BoxConstraints(maxWidth: 400),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: oldPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Old Password",
                      labelText: "Old Password",
                    ),
                    validator: (val) =>
                        val == null || val.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: newPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "New Password",
                      hintText: "New Password",
                    ),
                    validator: (val) =>
                        val == null || val.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Confirm Password",
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
          ),
        ),
        actions: [
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
            child: const Text("Change", style: TextStyle(color: Colors.white)),
          ),
        ],
      );
    },
  );
}
