import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/storage/shared_prefs_service.dart';
import '../../../../../core/storage/storage_keys.dart';
import '../../../domain/entities/user_sign_up_entity.dart';
import '../../../domain/repositories_contract/sign_up_data_contract.dart';
import '../sign_up_data_source_contract/sign_up_data_source_contract.dart';

@LazySingleton(as: SignUpDataContract)
class SignUpDomainImpl implements SignUpDataContract {
  final SignUpDataSourceContract _remoteDataSource;
  final SharedPrefsService _prefs;

  SignUpDomainImpl(this._remoteDataSource, this._prefs);

  @override
  Future<Either<Failure, UserSignUpEntity>> signUp(
      UserSignUpEntity entity) async {
    final dto = entity.toDto();
    final result = await _remoteDataSource.signUp(dto);

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