class ApiEndpoints {
  static const String baseUrl = 'https://exam.elevateegy.com/api/v1';
  // ====================== AUTHENTICATION

  static const String login = '/auth/signin';
  static const String signup = '/auth/signup';
  static const String forgetPassword = '/auth/forgotPassword';
  static const String verifyResetCode="/auth/verifyResetCode";
  static const String resetPassword="/auth/resetPassword";
  static const String changePassword="/auth/changePassword";
  
  static const String profileData = '/auth/profileData';
    static const String editProfile = '/auth/editProfile';
  static const String logout = '/auth/logout';
  static const String deleteMe = '/auth/deleteMe';

  static const String subjects = '/subjects';
  static const String singleSubject = '/subjects/{id}';

  static const String exams = '/exams';
  static const String singleExam = '/exams/{id}';

  static const String questions = '/questions';
  static const String singleQuestion = '/questions/{id}';
  static const String questionsHistory = '/questions/history';
  static const String questionsByExam = '/questions?exam={id}';
  static const String questionsCheck = '/questions/check';
}

