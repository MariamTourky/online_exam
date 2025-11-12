import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/login/presentation/manager/login_cubit.dart';
import 'package:online_exam/features/recovery_password/presentation/manager/forget_password/forget_password_cubit.dart';
import 'package:online_exam/features/recovery_password/presentation/manager/reset_password/reset_password_cubit.dart';
import 'package:online_exam/features/recovery_password/presentation/views/verify_reset_code_view.dart';
import 'package:online_exam/features/sign_up/presentation/manager/signup_cubit.dart';
import '../../core/di/config/di.dart';
import '../../features/home/presentation/views/home_view.dart';
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
    initialLocation: RouteNames.resetPassword,
    routes: [
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => BlocProvider( create: (_) => getIt<LoginCubit>(),child: const LoginView())),
      GoRoute(
        path: RouteNames.signup,
        builder: (context, state) => BlocProvider( create: (_) => getIt<SignupCubit>(),child:const SignUpView())),
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
        path: RouteNames.home,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );}

