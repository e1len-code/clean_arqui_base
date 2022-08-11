class ServerException implements Exception {
  final String message;
  ServerException(
      {this.message = 'Servidor no disponible... Inténtelo más tarde'});
}

class TimeOutException implements Exception {
  final String message;
  TimeOutException(
      {this.message = 'El tiempo de espera se agotó... Inténtelo más tarde'});
}

class ApiResponseException implements Exception {
  final int statusCode;
  final String message;
  ApiResponseException(
      {this.statusCode = 500, this.message = 'Error de servidor interno...'});
}

class CacheException implements Exception {
  final String message;
  CacheException({this.message = 'Error en el cache del móvil...'});
}
