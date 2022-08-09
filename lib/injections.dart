import 'package:clean_arqui_base/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerFactory(() => AuthBloc());
}
