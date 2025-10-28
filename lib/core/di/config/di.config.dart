// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:go_router/go_router.dart' as _i583;
import 'package:injectable/injectable.dart' as _i526;
import 'package:online_exam/core/di/modules/dio_module.dart' as _i471;
import 'package:online_exam/core/di/modules/router_module.dart' as _i372;
import 'package:online_exam/core/di/modules/shared_prefs_module.dart' as _i818;
import 'package:online_exam/core/network/api_service.dart' as _i1063;
import 'package:online_exam/core/storage/shared_prefs_service.dart' as _i1016;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPrefsModule = _$SharedPrefsModule();
    final networkModule = _$NetworkModule();
    final routerModule = _$RouterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPrefsModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i583.GoRouter>(() => routerModule.goRouter);
    gh.lazySingleton<_i1016.SharedPrefsService>(
      () => _i1016.SharedPrefsService(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i1063.ApiService>(
      () => _i1063.ApiService(gh<_i361.Dio>()),
    );
    return this;
  }
}

class _$SharedPrefsModule extends _i818.SharedPrefsModule {}

class _$NetworkModule extends _i471.NetworkModule {}

class _$RouterModule extends _i372.RouterModule {}
