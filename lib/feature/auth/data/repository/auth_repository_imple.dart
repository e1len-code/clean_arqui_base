import 'package:clean_arqui_base/core/error/exceptions.dart';
import 'package:clean_arqui_base/core/network/network_info.dart';
import 'package:clean_arqui_base/feature/auth/data/datasources/auth_remote_data.dart';
import 'package:clean_arqui_base/feature/auth/domain/entities/auth.dart';
import 'package:clean_arqui_base/core/error/failures.dart';
import 'package:clean_arqui_base/feature/auth/domain/entities/loginParams.dart';
import 'package:clean_arqui_base/feature/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImple extends AuthRepository {
  final AuthRemoteData remoteData;
  final NetworkInfo networkInfo;
  AuthRepositoryImple({required this.remoteData, required this.networkInfo});
  @override
  Future<Either<Failure, Auth>> login(LoginParams loginParams) async {
    if (await networkInfo.isConnected) {
      try {
        final auth = await remoteData.login(loginParams);
        return Right(auth);
      } on TimeOutException {
        return Left(TimeOutFailure());
      } catch (ex) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
