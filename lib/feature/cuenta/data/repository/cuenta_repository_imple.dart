import 'package:clean_arqui_base/core/error/exceptions.dart';
import 'package:clean_arqui_base/core/network/network_info.dart';
import 'package:clean_arqui_base/feature/cuenta/data/datasources/cuenta_remote_data.dart';
import 'package:clean_arqui_base/feature/cuenta/domain/entities/cuenta.dart';
import 'package:clean_arqui_base/core/utils/tupla.dart';
import 'package:clean_arqui_base/core/error/failures.dart';
import 'package:clean_arqui_base/feature/cuenta/domain/repository/cuenta_repository.dart';
import 'package:dartz/dartz.dart';

class CuentaRepositoryImple extends CuentaRepository {
  final CuentaRemoteData cuentaRemoteData;
  final NetworkInfo networkInfo;
  CuentaRepositoryImple({
    required this.cuentaRemoteData,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> deleteCuenta(String codCuenta) async {
    if (await networkInfo.isConnected) {
      try {
        final _deleteCuenta = await cuentaRemoteData.delete(codCuenta);
        return Right(_deleteCuenta);
      } on TimeOutException {
        return Left(TimeOutFailure());
      } catch (ex) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> existCuenta(String codCuenta) async {
    if (await networkInfo.isConnected) {
      try {
        final existCuenta = await cuentaRemoteData.existCuenta(codCuenta);
        return Right(existCuenta);
      } on TimeOutException {
        return Left(TimeOutFailure());
      } catch (ex) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Cuenta>>> filterList(Cuenta cuenta) async {
    if (await networkInfo.isConnected) {
      try {
        final filterList = await cuentaRemoteData.filterCuentas(cuenta);
        return Right(filterList);
      } on TimeOutFailure {
        return Left(TimeOutFailure());
      } catch (ex) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Cuenta>> getCuenta(String codCuenta) async {
    if (await networkInfo.isConnected) {
      try {
        final cuenta = await cuentaRemoteData.getCuenta(codCuenta);
        return Right(cuenta);
      } on TimeOutFailure {
        return Left(TimeOutFailure());
      } catch (ex) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Cuenta>>> list() async {
    if (await networkInfo.isConnected) {
      try {
        final list = await cuentaRemoteData.list();
        return Right(list);
      } on TimeOutFailure {
        return Left(TimeOutFailure());
      } catch (ex) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Tupla<bool, Cuenta>>> save(Cuenta cuenta) async {
    if (await networkInfo.isConnected) {
      try {
        final saved = await cuentaRemoteData.save(cuenta);
        return Right(Tupla(saved, cuenta));
      } on TimeOutFailure {
        return Left(TimeOutFailure());
      } catch (ex) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
