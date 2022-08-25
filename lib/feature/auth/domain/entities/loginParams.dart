class LoginParams {
  String codUsuario;
  String password;
  String token;
  LoginParams({
    required this.codUsuario,
    required this.password,
    required this.token,
  });
  Map<String, dynamic> toJson() {
    return {
      "correoElectronico": codUsuario,
      "password": password,
    };
  }
}
