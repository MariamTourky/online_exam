import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/home/presentation/manager/home_cubit.dart';
import 'package:online_exam/features/login/presentation/manager/login_cubit.dart';
import 'package:online_exam/features/sign_up/presentation/manager/signup_cubit.dart';
import '../../core/di/config/di.dart';
import '../../features/forget_password/presentation/views/forget_password_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/login/presentation/views/login_view.dart';
import '../../features/sign_up/presentation/views/sign_up_view.dart';
import 'route_names.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@singleton
class AppRouter {
  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: RouteNames.login,
    routes: [
      GoRoute(
        path: RouteNames.login,
        pageBuilder: (context, state) => MaterialPage(
          child: BlocProvider(
            create: (_) => getIt<LoginCubit>(),
            child: const LoginView(),
          ),
        ),
      ),
      GoRoute(
        path: RouteNames.signup,
        pageBuilder: (context, state) => MaterialPage(
          child: Builder(
            builder: (context) {
              return Builder(
                builder: (context) {
                  return BlocProvider(
                    create: (_) => getIt<SignupCubit>(),
                    child: const SignUpView(),
                  );
                }
              );
            }
          ),
        ),
      ),
      GoRoute(
        path: RouteNames.forgetPassword,
        pageBuilder: (context, state) =>
            const MaterialPage(child: ForgetPasswordView()),
      ),
      GoRoute(
        path: RouteNames.home,
        pageBuilder: (context, state) => MaterialPage(
          child: Builder(
            builder: (context) {
              return BlocProvider(
                create: (_) => getIt<HomeCubit>(),
                child: const HomeView(),
              );
            }
          ),
        ),
      ),
    ],
  );
}
