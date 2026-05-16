import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/app_sections/presentation/manager/app_section_cubit.dart';
import 'package:online_exam/features/app_sections/presentation/pages/app_sections.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';
import 'package:online_exam/features/exams/presentation/exam/view/pages/exam_page.dart';
import 'package:online_exam/features/exams/presentation/exam/view/screens/exam_description.dart';
import 'package:online_exam/features/exams/presentation/question/view/pages/question_page.dart';
import 'package:online_exam/features/exams/presentation/question/view_model/cubit/question_cubit.dart';
import 'package:online_exam/features/results/domain/entities/result_entity.dart';
import 'package:online_exam/features/results/presentation/pages/answers_review_screen.dart';
import 'package:online_exam/features/results/presentation/pages/result_page.dart';
import 'package:online_exam/features/exams/presentation/question/view_model/cubit/question_intent.dart';
import 'package:online_exam/features/login/presentation/manager/login_cubit.dart';
import 'package:online_exam/features/recovery_password/presentation/manager/forget_password/forget_password_cubit.dart';
import 'package:online_exam/features/recovery_password/presentation/manager/reset_password/reset_password_cubit.dart';
import 'package:online_exam/features/recovery_password/presentation/views/verify_reset_code_view.dart';
import 'package:online_exam/features/sign_up/presentation/manager/signup_cubit.dart';
import 'package:online_exam/features/subjects/presentation/view_model/cubit/subject_cubit.dart';
import '../../core/di/config/di.dart';
import '../../features/subjects/presentation/views/pages/subjects_page.dart';
import '../../features/login/presentation/views/login_view.dart';
import '../../features/recovery_password/presentation/manager/verify_reset_code/verify_reset_code_cubit.dart';
import '../../features/recovery_password/presentation/views/forget_password_view.dart';
import '../../features/recovery_password/presentation/views/reset_password_view.dart';
import '../../features/sign_up/presentation/views/sign_up_view.dart';
import 'route_names.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@lazySingleton
class AppRouter {
  GoRouter get router => GoRouter(
    debugLogDiagnostics: true,
    initialLocation: RouteNames.login,
    routes: [
      GoRoute(
        path: RouteNames.home,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => getIt<AppSectionCubit>(),
            child: const AppSections(),
          );
        },
      ),
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<LoginCubit>(),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: RouteNames.signup,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<SignupCubit>(),
          child: const SignUpView(),
        ),
      ),
      GoRoute(
        path: RouteNames.forgetPassword,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<ForgetPasswordCubit>(),
          child: const ForgetPasswordView(),
        ),
      ),

      GoRoute(
        path: RouteNames.emailVerification,
        builder: (context, state) {
          final email = state.extra as String;
          return BlocProvider(
            create: (_) => getIt<VerifyResetCodeCubit>(param1: email),
            child: const VerifyResetCodeView(),
          );
        },
      ),
      GoRoute(
        path: RouteNames.resetPassword,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<ResetPasswordCubit>(),
          child: const ResetPasswordView(),
        ),
      ),
      GoRoute(
        path: RouteNames.subjects,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<SubjectCubit>(),
          child: const SubjectsPage(),
        ),
      ),

      GoRoute(
        path: RouteNames.exams,
        builder: (context, state) {
          final subjectId = state.extra as String?;
          return ExamPage(subjectId: subjectId);
        },
      ),

      GoRoute(
        path: RouteNames.question,
        builder: (context, state) {
          final exam = state.extra as ExamModel;
          return BlocProvider(
            create: (_) => getIt<QuestionCubit>()
              ..doIntent(GetQuestionIntent(examId: exam.id ?? "", exam: exam)),
            child: QuestionPage(exam: exam),
          );
        },
      ),
      GoRoute(
        path: RouteNames.examDescription,
        builder: (context, state) {
          final exam = state.extra as ExamModel;
          return ExamDescription(exam: exam, subjectId: "");
        },
      ),
      GoRoute(
        path: RouteNames.results,
        builder: (context, state) {
          return const ResultPage();
        },
      ),
      GoRoute(
        path: RouteNames.answers,
        builder: (context, state) {
          final result = state.extra as ResultEntity;
          return AnswersReviewScreen(result: result);
        },
      ),
      GoRoute(
        path: RouteNames.appStart,
        builder: (context, state) => AppSections(),
      ),
    ],
  );
}
