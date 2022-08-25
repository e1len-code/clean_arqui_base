import 'package:clean_arqui_base/core/error/failures.dart';
import 'package:clean_arqui_base/feature/auth/domain/entities/auth.dart';
import 'package:clean_arqui_base/feature/auth/domain/entities/loginParams.dart';
import 'package:clean_arqui_base/feature/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase {
  Future<Either<Failure, Auth>> login(LoginParams loginParams);
}

class AuthUseCase extends UseCase {
  final AuthRepository authRepository;
  AuthUseCase({required this.authRepository});
  @override
  Future<Either<Failure, Auth>> login(LoginParams loginParams) async {
    return await authRepository.login(loginParams);
  }
}
