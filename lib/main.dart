import 'package:flutter/material.dart';

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

    final goRouter = getIt<AppRouter>().router;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      title: 'Online Exam',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
    );
  }
}

