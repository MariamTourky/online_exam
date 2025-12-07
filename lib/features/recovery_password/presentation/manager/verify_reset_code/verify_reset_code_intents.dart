sealed class VerifyResetCodeIntent {}

class FormChangedIntent extends VerifyResetCodeIntent {
  final String code;
  FormChangedIntent(this.code);
}

class SubmitVerifyCodeIntent extends VerifyResetCodeIntent {}

class ResendCodeIntent extends VerifyResetCodeIntent {}