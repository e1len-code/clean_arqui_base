import 'package:bloc/bloc.dart';
import 'package:clean_arqui_base/feature/cuenta/domain/entities/cuenta.dart';
import 'package:clean_arqui_base/feature/cuenta/domain/usecase/cuenta_usecase.dart';
import 'package:meta/meta.dart';

part 'cuenta_event.dart';
part 'cuenta_state.dart';

class CuentaBloc extends Bloc<CuentaEvent, CuentaState> {
  final CuentaUseCase cuentaUseCase;
  CuentaBloc({required this.cuentaUseCase}) : super(CuentaInitial()) {
    on<ListEvent>(((event, emit) async {
      emit(LoadingState());
      final failureOrListed = await cuentaUseCase.list();
      emit(failureOrListed.fold(
          (failure) => ErrorState(message: failure.message),
          (listCuenta) => ListedState(listCuenta: listCuenta)));
    }));
  }
}
