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
import 'package:online_exam/features/login/data/repositories/login_data_source_contract/login_data_source_contract.dart'
    as _i1036;
import 'package:online_exam/features/login/data/repositories/login_domain_impl/login_domain_impl.dart'
    as _i536;
import 'package:online_exam/features/login/data_sources/remote/login_remote_data_source.dart'
    as _i648;
import 'package:online_exam/features/login/data_sources/remote/login_service/login_service.dart'
    as _i121;
import 'package:online_exam/features/login/domain/repositories_contract/login_data_contract.dart'
    as _i346;
import 'package:online_exam/features/login/domain/use_cases/login_usecase.dart'
    as _i821;
import 'package:online_exam/features/login/presentation/manager/login_cubit.dart'
    as _i135;
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
import 'package:online_exam/features/recovery_password/domain/use_cases/forget_password_usecase.dart'
    as _i341;
import 'package:online_exam/features/recovery_password/domain/use_cases/reset_password_usecase.dart'
    as _i503;
import 'package:online_exam/features/recovery_password/domain/use_cases/verify_reset_code_usecase.dart'
    as _i170;
import 'package:online_exam/features/recovery_password/presentation/manager/forget_password/forget_password_cubit.dart'
    as _i330;
import 'package:online_exam/features/recovery_password/presentation/manager/verify_reset_code/verify_reset_code_cubit.dart'
    as _i1012;
import 'package:online_exam/features/sign_up/data/repositories/sign_up_data_source_contract/sign_up_data_source_contract.dart'
    as _i1020;
import 'package:online_exam/features/sign_up/data/repositories/sign_up_domain_impl/sign_up_domain_impl.dart'
    as _i509;
import 'package:online_exam/features/sign_up/data_sources/remote/sign_up_remote_data_source.dart'
    as _i664;
import 'package:online_exam/features/sign_up/data_sources/remote/sign_up_service/sign_up_service.dart'
    as _i81;
import 'package:online_exam/features/sign_up/domain/repositories_contract/sign_up_data_contract.dart'
    as _i964;
import 'package:online_exam/features/sign_up/domain/use_cases/sign_up_usecase.dart'
    as _i983;
import 'package:online_exam/features/sign_up/presentation/manager/signup_cubit.dart'
    as _i926;
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
    gh.lazySingleton<_i121.LoginService>(
      () => _i121.LoginService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i917.RecoveryPasswordService>(
      () => _i917.RecoveryPasswordService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i81.SignUpService>(
      () => _i81.SignUpService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i1036.LoginDataSourceContract>(
      () => _i648.LoginRemoteDataSourceImpl(gh<_i121.LoginService>()),
    );
    gh.lazySingleton<_i1020.SignUpDataSourceContract>(
      () => _i664.SignUpRemoteDataSourceImpl(gh<_i81.SignUpService>()),
    );
    gh.lazySingleton<_i377.RecoverPasswordDataScourcContract>(
      () => _i826.RecoverPasswordDataImpl(gh<_i917.RecoveryPasswordService>()),
    );
    gh.lazySingleton<_i964.SignUpDataContract>(
      () => _i509.SignUpDomainImpl(
        gh<_i1020.SignUpDataSourceContract>(),
        gh<_i1016.SharedPrefsService>(),
      ),
    );
    gh.lazySingleton<_i346.LoginDataContract>(
      () => _i536.LoginDomainImpl(
        gh<_i1036.LoginDataSourceContract>(),
        gh<_i1016.SharedPrefsService>(),
      ),
    );
    gh.lazySingleton<_i821.LoginUseCase>(
      () => _i821.LoginUseCase(gh<_i346.LoginDataContract>()),
    );
    gh.lazySingleton<_i983.SignUpUseCase>(
      () => _i983.SignUpUseCase(gh<_i964.SignUpDataContract>()),
    );
    gh.factory<_i135.LoginCubit>(
      () => _i135.LoginCubit(gh<_i821.LoginUseCase>()),
    );
    gh.lazySingleton<_i512.RecoveryPasswordDataContract>(
      () => _i339.RercoveryPasswordDomainImpl(
        gh<_i377.RecoverPasswordDataScourcContract>(),
      ),
    );
    gh.lazySingleton<_i341.ForgetPasswordUseCase>(
      () =>
          _i341.ForgetPasswordUseCase(gh<_i512.RecoveryPasswordDataContract>()),
    );
    gh.lazySingleton<_i503.ResetPasswordUseCase>(
      () =>
          _i503.ResetPasswordUseCase(gh<_i512.RecoveryPasswordDataContract>()),
    );
    gh.lazySingleton<_i170.VerifyResetCodeUseCase>(
      () => _i170.VerifyResetCodeUseCase(
        gh<_i512.RecoveryPasswordDataContract>(),
      ),
    );
    gh.factory<_i926.SignupCubit>(
      () => _i926.SignupCubit(gh<_i983.SignUpUseCase>()),
    );
    gh.factoryParam<_i1012.VerifyResetCodeCubit, String, dynamic>(
      (email, _) => _i1012.VerifyResetCodeCubit(
        gh<_i170.VerifyResetCodeUseCase>(),
        gh<_i341.ForgetPasswordUseCase>(),
        email,
      ),
    );
    gh.factory<_i330.ForgetPasswordCubit>(
      () => _i330.ForgetPasswordCubit(gh<_i341.ForgetPasswordUseCase>()),
    );
    return this;
  }
}

class _$SharedPrefsModule extends _i818.SharedPrefsModule {}

class _$NetworkModule extends _i471.NetworkModule {}
