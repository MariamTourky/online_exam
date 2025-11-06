import 'package:flutter/material.dart';
import 'package:online_exam/config/routes/route_names.dart';
import 'package:online_exam/config/theme/AppTheme.dart';

import 'config/routes/app_router.dart';
import 'core/di/config/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
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

