sealed class ResetPasswordIntent {
  const ResetPasswordIntent();

  static const formChanged = FormChangedIntent();
  static const togglePasswordVisibility = TogglePasswordVisibilityIntent();
  static const submit = SubmitResetPasswordIntent();
}

class FormChangedIntent extends ResetPasswordIntent {
  const FormChangedIntent();
}

class TogglePasswordVisibilityIntent extends ResetPasswordIntent {
  const TogglePasswordVisibilityIntent();
}

class SubmitResetPasswordIntent extends ResetPasswordIntent {
  const SubmitResetPasswordIntent();
}
