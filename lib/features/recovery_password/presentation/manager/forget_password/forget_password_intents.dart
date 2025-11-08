part of 'forget_password_cubit.dart';

sealed class ForgetPasswordIntent {
  const ForgetPasswordIntent();

  static const formChanged = FormChangedIntent();
  static const submit = SubmitForgetPasswordIntent();
}

class FormChangedIntent extends ForgetPasswordIntent {
  const FormChangedIntent();
}

class SubmitForgetPasswordIntent extends ForgetPasswordIntent {
  const SubmitForgetPasswordIntent();
}
