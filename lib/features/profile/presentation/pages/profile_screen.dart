import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/config/di.dart';
import 'package:online_exam/config/theme/app_colors.dart';
import 'package:online_exam/features/profile/data/models/request/edit_profile_request.dart';
import 'package:online_exam/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:online_exam/features/profile/presentation/cubit/profile_intent.dart';
import 'package:online_exam/features/profile/presentation/widgets/profile_text_field.dart';
import 'package:online_exam/features/profile/presentation/widgets/change_password_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _usernameController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _phoneController;

  late ProfileCubit _profileCubit;

  @override
  void initState() {
    super.initState();
    _profileCubit = getIt<ProfileCubit>()..doIntent(GetProfileDataIntent());
    _usernameController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController(text: "********");
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _profileCubit.close();
    super.dispose();
  }

  void _updateControllers(ProfileState state) {
    if (state.username != null && _usernameController.text != state.username) {
      _usernameController.text = state.username!;
    }
    if (state.firstName != null && _firstNameController.text != state.firstName) {
      _firstNameController.text = state.firstName!;
    }
    if (state.lastName != null && _lastNameController.text != state.lastName) {
      _lastNameController.text = state.lastName!;
    }
    if (state.email != null && _emailController.text != state.email) {
      _emailController.text = state.email!;
    }
    if (state.phone != null && _phoneController.text != state.phone) {
      _phoneController.text = state.phone!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _profileCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profile",
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            _updateControllers(state);

            if (state.error != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error.toString())));
            }
            if (state.message != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message!)));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            "https://www.w3schools.com/howto/img_avatar.png",
                          ), // Placeholder
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: AppColors.primaryBlue,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: AppColors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    ProfileTextField(
                      controller: _usernameController,
                      label: "User name",
                      validator: (value) =>
                          value == null || value.isEmpty ? "Required" : null,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ProfileTextField(
                            controller: _firstNameController,
                            label: "First name",
                            validator: (value) => value == null || value.isEmpty
                                ? "Required"
                                : null,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ProfileTextField(
                            controller: _lastNameController,
                            label: "Last name",
                            validator: (value) => value == null || value.isEmpty
                                ? "Required"
                                : null,
                          ),
                        ),
                      ],
                    ),
                    ProfileTextField(
                      controller: _emailController,
                      label: "Email",
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          value == null || value.isEmpty ? "Required" : null,
                    ),
                    ProfileTextField(
                      controller: _passwordController,
                      label: "Password",
                      isPassword: true,
                      readOnly: true,
                      onChangePassword: () =>
                          showChangePasswordDialog(context, _profileCubit),
                    ),
                    ProfileTextField(
                      controller: _phoneController,
                      label: "Phone number",
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                          value == null || value.isEmpty ? "Required" : null,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _profileCubit.doIntent(
                              EditProfileIntent(
                                EditProfileRequest(
                                  username: _usernameController.text,
                                  firstName: _firstNameController.text,
                                  lastName: _lastNameController.text,
                                  email: _emailController.text,
                                  phone: _phoneController.text,
                                  role: state.role ?? "user",
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          "Update",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
