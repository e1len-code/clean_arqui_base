import 'package:clean_arqui_base/core/network/headers.dart';
import 'package:clean_arqui_base/core/network/network_info.dart';
import 'package:clean_arqui_base/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as client;
import 'package:connectivity_plus/connectivity_plus.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerFactory(() => AuthBloc());

  //! =============== CORE
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(sl(), 'http://190.117.145.12/WebApiInnova'));
  sl.registerLazySingleton(() => Headers());
  //! =============== EXTERNAL
  //! External
  sl.registerLazySingleton(() => client.Client());
  sl.registerLazySingleton(() => Connectivity());
}
