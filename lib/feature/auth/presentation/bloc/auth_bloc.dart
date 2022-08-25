import 'package:bloc/bloc.dart';
import 'package:clean_arqui_base/feature/auth/domain/entities/auth.dart';
import 'package:clean_arqui_base/feature/auth/domain/entities/loginParams.dart';
import 'package:clean_arqui_base/feature/auth/domain/usecases/auth_usecase.dart';
import 'package:clean_arqui_base/feature/cuenta/presentation/bloc/cuenta_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase authUseCase;
  AuthBloc({required this.authUseCase}) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoadingState());
      final failureOrLogin = await authUseCase.login(event.loginParams);
      emit(failureOrLogin.fold(
          (failure) => ErrorState(message: failure.message),
          (auth) => LoggedState(auth: auth)));
    });
  }
}
