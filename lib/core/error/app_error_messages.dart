class AppErrorMessages {
  //Server Errors //////////////////////////////////////////////////////////////////////
  static const String connectionTimeout = 'Connection timed out';
  static const String noInternet = 'No Internet connection';
  static const String unauthorized = 'Unauthorized request';
  static const String serverError = 'Server error occurred';
  static const String unknownError = 'Something went wrong, please try again later';


  //Validator Errors //////////////////////////////////////////////////////////////////////

  static const String invalidEmail = 'Invalid email address';
  static const String weakPassword = 'Password too weak';
  static const String emailRequired= "Email is required";
  static const String passwordRequired="Password is required";
  static const String passwordWithCapital='Must contain a capital letter';
  static const String passwordWithNumber='Must contain a number';
  static const String passwordDontMatch= "Passwords do not match";
  static const String confirmPassword ='Confirm your password';
  static const String phoneRequired ='Phone is required';
  static const String invalidnumber='Invalid Egyptian phone number';
  static const String required ='Required';
  static const String least3Charachters="Must be at least 3 characters";
  static const String least6Charachters="At least 6 characters required";
  static const String invalidNamed="Invalid name";
}
