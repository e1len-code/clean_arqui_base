import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  final String userName;
  final String rol;
  final String token;
  const Auth({
    required this.userName,
    required this.rol,
    required this.token,
  });

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      userName: json["nombres"],
      rol: json["rol"],
      token: json["accessToken"],
    );
  }

  @override
  List<Object> get props => [userName];
}
