import 'package:clean_arqui_base/core/error/failures.dart';
import 'package:clean_arqui_base/core/utils/tupla.dart';
import 'package:clean_arqui_base/feature/cuenta/domain/entities/cuenta.dart';
import 'package:clean_arqui_base/feature/cuenta/domain/repository/cuenta_repository.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase {
  Future<Either<Failure, List<Cuenta>>> list();
  Future<Either<Failure, List<Cuenta>>> filterList(Cuenta cuenta);
  Future<Either<Failure, Tupla<bool, Cuenta>>> save(Cuenta cuenta);
  Future<Either<Failure, Cuenta>> getCuenta(String codCuenta);
  Future<Either<Failure, bool>> deleteCuenta(String codCuenta);
}

class CuentaUseCase extends UseCase {
  final CuentaRepository repository;
  CuentaUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> deleteCuenta(String codCuenta) async {
    return await repository.deleteCuenta(codCuenta);
  }

  @override
  Future<Either<Failure, List<Cuenta>>> filterList(Cuenta cuenta) async {
    return await repository.filterList(cuenta);
  }

  @override
  Future<Either<Failure, Cuenta>> getCuenta(String codCuenta) async {
    final _exist = await repository.existCuenta(codCuenta);
    _exist.fold((failure) => DataFailure(message: failure.message),
        (exist) async {
      if (exist) {
        return await repository.getCuenta(codCuenta);
      } else {
        return Left(DataFailure());
      }
    });
    return await repository.getCuenta(codCuenta);
  }

  @override
  Future<Either<Failure, List<Cuenta>>> list() async {
    return await repository.list();
  }

  @override
  Future<Either<Failure, Tupla<bool, Cuenta>>> save(Cuenta cuenta) async {
    return await repository.save(cuenta);
  }
}
