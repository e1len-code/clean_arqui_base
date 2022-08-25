part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoadingState extends AuthState {}

class ErrorState extends AuthState {
  final String message;
  ErrorState({required this.message});
}

class LoggedState extends AuthState {
  final Auth auth;
  LoggedState({required this.auth});
}
