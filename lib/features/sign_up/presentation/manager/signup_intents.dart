sealed class SignupIntent {
  const SignupIntent();

  static const formChanged = FormChangedIntent();
  static const togglePasswordVisibility = TogglePasswordVisibilityIntent();
  static const toggleRePasswordVisibility = ToggleRePasswordVisibilityIntent();
  static const submit = SubmitSignupIntent();
}

class FormChangedIntent extends SignupIntent {
  const FormChangedIntent();
}

class TogglePasswordVisibilityIntent extends SignupIntent {
  const TogglePasswordVisibilityIntent();
}

class ToggleRePasswordVisibilityIntent extends SignupIntent {
  const ToggleRePasswordVisibilityIntent();
}

class SubmitSignupIntent extends SignupIntent {
  const SubmitSignupIntent();
}
