part of 'cuenta_bloc.dart';

enum Proceso { guardar, recuperar, eliminar, listar }

@immutable
abstract class CuentaState {}

class CuentaInitial extends CuentaState {}

class EquipoOficinaInitial extends CuentaState {}

class LoadingState extends CuentaState {}

class SavedState extends CuentaState {
  final bool guardado;
  final Cuenta cuenta;
  SavedState({required this.guardado, required this.cuenta});
}

class DeletedState extends CuentaState {
  final int eliminado;

  DeletedState({required this.eliminado});
}

class RetrivedState extends CuentaState {
  final Cuenta cuenta;
  RetrivedState({required this.cuenta});
}

class ExisteState extends CuentaState {
  final bool existe;
  ExisteState({required this.existe});
}

class ListedState extends CuentaState {
  final List<Cuenta> listCuenta;
  ListedState({required this.listCuenta});
}

class ErrorState extends CuentaState {
  final Proceso? proceso;
  final String message;
  ErrorState({this.proceso, this.message = ''});
}
