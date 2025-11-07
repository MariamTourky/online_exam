import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/constants/app_constants.dart';
import '../../../../config/constants/schaffold_messages.dart';
import '../../../../config/theme/app_text_styles.dart';
import '../../../../core/utils/validators/show_snak_bar.dart';
import '../manager/signup_cubit.dart';
import '../widgets/signup_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
          showAppSnackbar(context, state.errorMessage!, isError: true);
        }
        if (state.success) {
          showAppSnackbar(context,SchaffoldMessages.signUpSuccessfully );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
              surfaceTintColor: Colors.transparent,
              title: const Text(
                  AppConstants.signup,
                  style: AppTextStyles.medium20Black),
          ),
          body:  SignupForm(),
        );
      },
    );
  }
}
