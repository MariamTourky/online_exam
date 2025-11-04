import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/constants/app_constants.dart';
import '../../../../config/constants/schaffold_messages.dart';
import '../../../../core/di/config/di.dart';
import '../manager/signup_cubit.dart';
import '../widgets/signup_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SignupCubit>(),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(SchaffoldMessages.signUpSuccessfully)),
            );
          } else if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text(AppConstants.signup)),
            body:  SignupForm(),
          );
        },
      ),
    );
  }
}
