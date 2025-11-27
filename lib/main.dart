import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/theme/app_theme.dart';
import 'package:online_exam/features/home/presentation/manager/home_cubit.dart';
import 'package:online_exam/features/login/presentation/manager/login_cubit.dart';
import 'package:online_exam/features/sign_up/presentation/manager/signup_cubit.dart';

import 'config/routes/app_router.dart';
import 'core/di/config/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<HomeCubit>()),
        BlocProvider(create: (_) => getIt<LoginCubit>()),
        BlocProvider(create: (_) => getIt<SignupCubit>()),
        // add others if needed
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final appRouter = getIt<AppRouter>().router;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      title: 'Online Exam',
      theme: AppTheme.lightTheme(),
    );
  }
}

