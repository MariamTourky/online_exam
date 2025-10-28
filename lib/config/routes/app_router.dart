import 'package:go_router/go_router.dart';
import '../../features/forget_password/presentation/views/forget_password_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/login/presentation/views/login_view.dart';
import '../../features/sign_up/presentation/views/sign_up_view.dart';
import 'route_names.dart';
class AppRouter {
  GoRouter get router => GoRouter(
    debugLogDiagnostics: true,
    initialLocation: RouteNames.login,
    routes: [
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: RouteNames.signup,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: RouteNames.forgetPassword,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: RouteNames.home,
       builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
      // GoRoute(
      //   path: RouteNames.emailVerification,
      //   builder: (context, state) => const EmailVerificationView(),
      // ),
      // GoRoute(
      //   path: RouteNames.resetPassword,
      //   builder: (context, state) => const ResetPasswordView(),
      // ),

