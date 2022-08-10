import 'package:clean_arqui_base/feature/auth/domain/entities/auth.dart';
import 'package:clean_arqui_base/feature/auth/domain/entities/loginParams.dart';

abstract class AuthRemoteData {
  Future<Auth> login(LoginParams logParams);
}

class AuthRemoteDataImple extends AuthRemoteData {
  @override
  Future<Auth> login(Object logParams) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
