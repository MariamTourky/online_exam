class ApiEndpoints {
  static const String baseUrl = 'https://exam.elevateegy.com/api/v1';
  // ====================== AUTHENTICATION

  static const String login = '/auth/signin';
  static const String signup = '/auth/signup';
  static const String forgetPassword = '/auth/forgotPassword';
  static const String verifyResetCode="/auth/verifyResetCode";
  static const String resetPassword="/auth/resetPassword";
  static const String userData = 'https://exam.elevateegy.com/api/v1/auth/profileData';
  static const String Subjects = 'https://exam.elevateegy.com/api/v1/subjects';
    static const String singleSubject = 'https://exam.elevateegy.com/api/v1/subjects';

  static const String Exams = 'https://exam.elevateegy.com/api/v1/exams';
  

}
