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
import 'package:injectable/injectable.dart' as _i526;
import 'package:online_exam/config/routes/app_router.dart' as _i960;
import 'package:online_exam/core/di/modules/dio_module.dart' as _i471;
import 'package:online_exam/core/di/modules/shared_prefs_module.dart' as _i818;
import 'package:online_exam/core/network/api_service.dart' as _i1063;
import 'package:online_exam/core/storage/shared_prefs_service.dart' as _i1016;
import 'package:online_exam/features/recovery_password/data/repositories/recovery_password_data_source_contract/recovery_password_data_scource_contract.dart'
    as _i377;
import 'package:online_exam/features/recovery_password/data/repositories/recovery_password_domain_impl/recovery_password_domain_impl.dart'
    as _i339;
import 'package:online_exam/features/recovery_password/data_sources/remote/recovery_password_data_impl.dart'
    as _i826;
import 'package:online_exam/features/recovery_password/data_sources/remote/recovery_password_service/recovery_password_service.dart'
    as _i917;
import 'package:online_exam/features/recovery_password/domain/repositories_contract/recovery_password_data_contract.dart'
    as _i512;
import 'package:online_exam/features/recovery_password/domain/use_cases/reset_password_usecase.dart'
    as _i503;
import 'package:online_exam/features/recovery_password/presentation/manager/reset_password/reset_password_cubit.dart'
    as _i280;
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
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPrefsModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i960.AppRouter>(() => _i960.AppRouter());
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i1016.SharedPrefsService>(
      () => _i1016.SharedPrefsService(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i1063.ApiService>(
      () => _i1063.ApiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i917.RecoveryPasswordService>(
      () => _i917.RecoveryPasswordService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i377.RecoverPasswordDataScourcContract>(
      () => _i826.RecoverPasswordDataImpl(gh<_i917.RecoveryPasswordService>()),
    );
    gh.lazySingleton<_i512.RecoveryPasswordDataContract>(
      () => _i339.RercoveryPasswordDomainImpl(
        gh<_i377.RecoverPasswordDataScourcContract>(),
        gh<_i1016.SharedPrefsService>(),
      ),
    );
    gh.lazySingleton<_i503.ResetPasswordUseCase>(
      () =>
          _i503.ResetPasswordUseCase(gh<_i512.RecoveryPasswordDataContract>()),
    );
    gh.factory<_i280.ResetPasswordCubit>(
      () => _i280.ResetPasswordCubit(gh<_i503.ResetPasswordUseCase>()),
    );
    return this;
  }
}

class _$SharedPrefsModule extends _i818.SharedPrefsModule {}

class _$NetworkModule extends _i471.NetworkModule {}
