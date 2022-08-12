part of 'cuenta_bloc.dart';

@immutable
abstract class CuentaEvent {}

class SaveEvent extends CuentaEvent {
  final Cuenta cuenta;
  SaveEvent({required this.cuenta});
}

class RetriveEvent extends CuentaEvent {
  final String id;
  RetriveEvent({required this.id});
}

class DeleteEvent extends CuentaEvent {
  final String id;
  DeleteEvent({required this.id});
}

class ExistEvent extends CuentaEvent {
  final String codEquipoOficina;
  ExistEvent({required this.codEquipoOficina});
}

class ListEvent extends CuentaEvent {
  ListEvent();
}

class BuscarEvent extends CuentaEvent {
  final Cuenta cuenta;
  BuscarEvent({required this.cuenta});
}
