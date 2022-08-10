import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  final String userName;
  const Auth({
    required this.userName,
  });
  @override
  List<Object> get props => [userName];
}
