import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cuenta_event.dart';
part 'cuenta_state.dart';

class CuentaBloc extends Bloc<CuentaEvent, CuentaState> {
  CuentaBloc() : super(CuentaInitial()) {
    on<CuentaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
