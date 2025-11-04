import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/constants/app_constants.dart';
import '../../../../core/di/config/di.dart';
import '../../../../core/utils/validators/show_snak_bar.dart';
import '../manager/login_cubit.dart';
import '../widgets/login_form.dart';
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
            showAppSnackbar(context, state.errorMessage!, isError: true);

          }

          if (state.success) {
            showAppSnackbar(context,AppConstants.loginsuccess );



          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text(AppConstants.login)),
          body: const Padding(
            padding: EdgeInsets.all(16.0),
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}
