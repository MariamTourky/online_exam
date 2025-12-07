import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:online_exam/config/theme/app_theme.dart';
import 'package:online_exam/features/home/presentation/manager/explore/cubit/explore_cubit.dart';
import 'package:online_exam/features/login/presentation/manager/login_cubit.dart';
import 'package:online_exam/features/sign_up/presentation/manager/signup_cubit.dart';
import 'package:online_exam/generated/l10n.dart';

import 'config/routes/app_router.dart';
import 'core/di/config/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ExploreCubit>()),
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
  localizationsDelegates: const [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: S.delegate.supportedLocales,
  locale: Locale('en'), // or dynamically set
        
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      title: 'Online Exam',
      theme: AppTheme.lightTheme(),
    );
  }
}
