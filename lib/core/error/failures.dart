import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
abstract class Failure extends Equatable {
  String message;
  Failure({this.message = 'Failure'});

  @override
  List<Object?> get props => [message];
}

// ignore: must_be_immutable
class ServerFailure extends Failure {
  ServerFailure({message = 'Error en el servidor... Inténtelo más tarde'})
      : super(message: message);
}

class IdentificadorFailure extends Failure {
  IdentificadorFailure(
      {message =
          'Dispositivo no identificado. Contactarse con el administrador.'})
      : super(message: message);
}

// ignore: must_be_immutable
class CacheFailure extends Failure {
  CacheFailure({message = 'Error al recuperar datos locales'})
      : super(message: message);
}

// ignore: must_be_immutable
class TimeOutFailure extends Failure {
  TimeOutFailure(
      {message = "Se agotó el tiempo de espera... Inténtelo más tarde"})
      : super(message: message);
}

// ignore: must_be_immutable
class ApiResponseFailure extends Failure {
  ApiResponseFailure({message = 'Error en la respuesta del servidor'})
      : super(message: message);
}

class FormFailure extends Failure {
  FormFailure({message = 'Error en el formulario'}) : super(message: message);
}

class DataFailure extends Failure {
  DataFailure({message = 'Error en el proceso de procesamiento de datos'})
      : super(message: message);
}

/* class CacheFailure extends Failure {
  final String message;

  CacheFailure({this.message = 'Local Storage Failure'});

  @override
  List<Object?> get props => [message];
}

class TimeOutFailure extends Failure {
  final String message;

  TimeOutFailure({this.message = 'Time out Failure'});

  @override
  List<Object?> get props => [message];
}

class ApiResponseFailure extends Failure {
  final String message;
  ApiResponseFailure({this.message = 'Api Failure'});

  @override
  List<Object?> get props => [message];
}
 */