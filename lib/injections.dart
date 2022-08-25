import 'package:clean_arqui_base/core/network/headers.dart';
import 'package:clean_arqui_base/core/network/network_info.dart';
import 'package:clean_arqui_base/feature/auth/data/datasources/auth_remote_data.dart';
import 'package:clean_arqui_base/feature/auth/data/repository/auth_repository_imple.dart';
import 'package:clean_arqui_base/feature/auth/domain/repository/auth_repository.dart';
import 'package:clean_arqui_base/feature/auth/domain/usecases/auth_usecase.dart';
import 'package:clean_arqui_base/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_arqui_base/feature/cuenta/data/datasources/cuenta_remote_data.dart';
import 'package:clean_arqui_base/feature/cuenta/data/repository/cuenta_repository_imple.dart';
import 'package:clean_arqui_base/feature/cuenta/domain/repository/cuenta_repository.dart';
import 'package:clean_arqui_base/feature/cuenta/domain/usecase/cuenta_usecase.dart';
import 'package:clean_arqui_base/feature/cuenta/presentation/bloc/cuenta_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as client;
import 'package:connectivity_plus/connectivity_plus.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! =============== BLOC
  sl.registerFactory(() => AuthBloc(authUseCase: sl()));
  sl.registerFactory(() => CuentaBloc(cuentaUseCase: sl()));
  //! =============== USECASE
  sl.registerLazySingleton(() => CuentaUseCase(repository: sl()));
  sl.registerLazySingleton(() => AuthUseCase(authRepository: sl()));
  //! =============== REPOSITORY
  sl.registerLazySingleton<CuentaRepository>(
      () => CuentaRepositoryImple(cuentaRemoteData: sl(), networkInfo: sl()));
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImple(remoteData: sl(), networkInfo: sl()));
  //! =============== LOCAL DATA
  //! =============== REMOTE DATA
  sl.registerLazySingleton<CuentaRemoteData>(
      () => CuentaRemoteDataImple(client: sl()));
  sl.registerLazySingleton<AuthRemoteData>(
      () => AuthRemoteDataImple(client: sl()));
  //! =============== CORE
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(sl(), 'https://api-userspdf.herokuapp.com'));
  sl.registerLazySingleton(() => Headers());
  //! =============== EXTERNAL
  sl.registerLazySingleton(() => client.Client());
  sl.registerLazySingleton(() => Connectivity());
}
