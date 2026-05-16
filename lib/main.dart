import 'package:online_exam/config/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/config/constants/app_constants.dart';
import 'package:online_exam/config/theme/app_theme.dart';

import 'package:easy_localization/easy_localization.dart';
import 'config/routes/app_router.dart';
import 'package:online_exam/core/di/config/di.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();
  await configureDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: const [AppConstants.enLangKey, AppConstants.arLangKey],
      path: AppAssets.translations,
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
      title: AppConstants.appName,
      theme: AppTheme.lightTheme(),

      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
    );
  }
}
