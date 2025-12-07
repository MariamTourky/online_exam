import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/constants/app_constants.dart';
import '../../../../config/constants/schaffold_messages.dart';
import '../../../../config/routes/route_names.dart';
import '../../../../config/theme/app_text_styles.dart';
import '../../../../core/utils/show_snak_bar.dart';
import '../manager/verify_reset_code/verify_reset_code_cubit.dart';
import '../widgets/verify_reset_code_form.dart';

class VerifyResetCodeView extends StatelessWidget {
  const VerifyResetCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 0,
        title: const Text(
          AppConstants.password,
          style: AppTextStyles.medium20Black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocListener<VerifyResetCodeCubit, VerifyResetCodeState>(
        listenWhen: (previous, current) =>
        previous.success != current.success ||
            previous.errorMessage != current.errorMessage,
        listener: (context, state) {
          if (state.success) {
            showAppSnackbar(context,SchaffoldMessages.codeVerified );
            Future.delayed(const Duration(seconds: 1), () {
              context.push(RouteNames.resetPassword);
            });
          } else if (state.errorMessage != null) {
            showAppSnackbar(context, state.errorMessage!, isError: true);
          }
        },
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: VerifyResetCodeForm(),
        ),
      ),
    );
  }
}