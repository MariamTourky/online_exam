import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/login/data/repositories/login_data_source_contract/login_data_source_contract.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/storage/shared_prefs_service.dart';
import '../../../../../core/storage/storage_keys.dart';
import '../../../domain/entities/user_login_entity.dart';
import '../../../domain/repositories_contract/login_data_contract.dart';


@LazySingleton(as: LoginDataContract)
class LoginDomainImpl implements LoginDataContract {
  final LoginDataSourceContract _remoteDataSource;
  final SharedPrefsService _prefs;

  LoginDomainImpl(this._remoteDataSource, this._prefs);

  @override
  Future<Either<Failure, UserLoginEntity>> login(
      UserLoginEntity entity) async {
    final dto = entity.toDto();
    final result = await _remoteDataSource.login(dto);

    return result.fold(
          (failure) => Left(failure),
          (response) async {
        if (response.token != null && response.token!.isNotEmpty) {
          await _prefs.saveString(StorageKeys.token, response.token!);
        }
        return Right(response.toEntity());
      },
    );
  }
}