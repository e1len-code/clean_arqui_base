import 'package:clean_arqui_base/core/error/failures.dart';
import 'package:clean_arqui_base/core/utils/tupla.dart';
import 'package:clean_arqui_base/feature/cuenta/domain/entities/cuenta.dart';
import 'package:dartz/dartz.dart';

abstract class CuentaRepository {
  Future<Either<Failure, List<Cuenta>>> list();
  Future<Either<Failure, List<Cuenta>>> filterList(Cuenta cuenta);
  Future<Either<Failure, Tupla<bool, Cuenta>>> save(Cuenta cuenta);
  Future<Either<Failure, Cuenta>> getCuenta(String codCuenta);
  Future<Either<Failure, bool>> deleteCuenta(String codCuenta);
  Future<Either<Failure, bool>> existCuenta(String codCuenta);
}
