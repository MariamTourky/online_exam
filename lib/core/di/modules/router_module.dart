import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import '../../../config/routes/app_router.dart';

@module
abstract class RouterModule {
  @lazySingleton
  GoRouter get goRouter => AppRouter().router;
}