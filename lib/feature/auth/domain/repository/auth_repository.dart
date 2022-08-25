import 'package:clean_arqui_base/core/error/failures.dart';
import 'package:clean_arqui_base/feature/auth/domain/entities/auth.dart';
import 'package:clean_arqui_base/feature/auth/domain/entities/loginParams.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, Auth>> login(LoginParams loginParams);
}
