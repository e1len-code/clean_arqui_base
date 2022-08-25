part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final LoginParams loginParams;
  LoginEvent({required this.loginParams});
}
