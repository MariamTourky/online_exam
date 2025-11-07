import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:online_exam/config/constants/app_constants.dart';
import 'package:online_exam/config/theme/app_colors.dart';
import 'package:online_exam/config/theme/app_theme.dart';
import 'package:online_exam/core/widgets/custom_action_text.dart';
import '../../../../config/theme/app_text_styles.dart';
import '../manager/verify_reset_code/verify_reset_code_cubit.dart';
import '../manager/verify_reset_code/verify_reset_code_intents.dart';

class VerifyResetCodeForm extends StatelessWidget {
  const VerifyResetCodeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyResetCodeCubit, VerifyResetCodeState>(
      builder: (context, state) {
        final cubit = context.read<VerifyResetCodeCubit>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              AppConstants.emailVerification,
              style: AppTextStyles.medium20Black,
            ),
            const SizedBox(height: 10),
            const Text(
              textAlign: TextAlign.center,
              AppConstants.verificationInstruction,
              style: AppTextStyles.baseRegular14,
            ),
            const SizedBox(height: 40),

            OtpTextField(
              numberOfFields: 6,
              borderColor: AppColors.primaryBlue,
              showFieldAsBox: true,
              textStyle: AppTextStyles.baseMedium16,
              fieldWidth: 45,
              fieldHeight: 60,
              onCodeChanged: (code) => cubit.doIntent(FormChangedIntent(code)),
              onSubmit: (code) {
                cubit.doIntent(FormChangedIntent(code));
                cubit.doIntent(SubmitVerifyCodeIntent());
              },
            ),

            if (state.isLoading)
              Transform.scale(
                scale: 1.8,
                child: const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppTheme.primaryBlue,
                ),
              ),
            const SizedBox(height: 20),

            // Resend text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppConstants.didNotReceiveCode,
                  style: AppTextStyles.baseRegularBlack,
                ),
                const SizedBox(width: 10),
                CustomActionText(
                  text: AppConstants.resend,
                  onTapAction: () => cubit.doIntent(ResendCodeIntent()),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
