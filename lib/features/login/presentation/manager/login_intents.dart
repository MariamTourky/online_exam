sealed class LoginIntent {
  const LoginIntent();

  static const formChanged = FormChangedIntent();
  static const togglePasswordVisibility = TogglePasswordVisibilityIntent();
  static const submit = SubmitLoginIntent();
}

class FormChangedIntent extends LoginIntent {
  const FormChangedIntent();
}

class TogglePasswordVisibilityIntent extends LoginIntent {
  const TogglePasswordVisibilityIntent();
}

class SubmitLoginIntent extends LoginIntent {
  const SubmitLoginIntent();
}
